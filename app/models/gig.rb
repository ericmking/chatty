class Gig < ApplicationRecord
  belongs_to :band

  def reminder_message
    message = "#{self.name} on <a href='../gigs/#{self.id}'>#{self.start_date} at #{self.location_venue} in #{self.location_city}</a>"
  end
end
