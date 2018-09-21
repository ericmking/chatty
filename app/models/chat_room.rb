class ChatRoom < ApplicationRecord
  belongs_to :band
  has_many :messages, dependent: :destroy
end
