class Upload < ApplicationRecord
  belongs_to :user

  after_create_commit :create_message

  def create_message
    puts "create a new message"

    message_body = "uploaded a new file #{self.name}!"
    chat_room = ChatRoom.find_by(id: 1)
    message = Message.create!(
                         body: message_body,
                         chat_room: chat_room,
                         user: self.user
    )
  end
end
