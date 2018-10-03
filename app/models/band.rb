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

  def add_user_to_band(user_id)
    user = User.find_by(id: user_id)
    if !has_member?(user.id)
      BandMember.create!(
        band: @band,
        user_id: user
      )
    end
  end

  def has_member?(user_id)
    band_members = self.users.where(id: user_id)
    if band_members.size > 0 then
      true
    else
      false
    end
  end
end
