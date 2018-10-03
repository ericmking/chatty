class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :invitable

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :uploads, dependent: :destroy
  has_many :band_members
  has_many :bands, through: :band_members
  has_many :tasks, class_name: 'user'

  has_one_attached :avatar
end
