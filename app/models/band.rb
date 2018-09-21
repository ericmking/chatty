class Band < ApplicationRecord
  has_many :band_members
  has_many :users, through: :band_members
  has_many :gigs
  has_many :tasks

  has_one :chat_room
  has_one :folder

  after_create_commit :create_resources

  def create_resources
    # Create the default chat room for the band
    chat_room = ChatRoom.create(name: self.name)
    self.chat_room = chat_room
    self.save!

    # Likewise create the default folder for the band
    folder = Folder.create(name: self.name)
    self.folder = folder
    self.save!
  end
end
