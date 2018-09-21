class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :body, presence: true, length: {minimum: 1}

  after_create_commit :post_message

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end

  def post_message
    MessageBroadcastJob.perform_later(self)
  end
end
