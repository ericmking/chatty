class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :body, presence: true, length: {minimum: 1}

  # after_create_commit :post_message
  # after_create_commit :create_reminder_messages

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end

  def self.create_message_with_reminders(body, chat_room_id, user_id)
    user = User.find_by(id: user_id)
    chat_room = ChatRoom.find_by(id: chat_room_id)
    message = Message.create(body: body, chat_room: chat_room, user: user)
    message.post_message

    # handle reminder messages
    message.create_reminder_messages
  end

  def post_message
    MessageBroadcastJob.perform_later(self)
  end

  def create_reminder_messages
    text_for_review = self.body.downcase
    if text_for_review.include?("next gig")      
      gigs = self.chat_room.band.gigs.all.order(:start_date)

      if gigs.size > 0
        reminder_message = "You've got #{gigs.size} upcoming gigs:"
        gigs.each do |gig|
          reminder_message << "<br\>"
          reminder_message << gig.reminder_message
        end            
      else
        reminder_message = "No upcoming gigs."
      end
    end

    message = Message.create(
      body: reminder_message, 
      user: self.user,
      chat_room: self.chat_room
    )

    message.post_message
  end
end
