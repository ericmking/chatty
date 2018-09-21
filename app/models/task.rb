class Task < ApplicationRecord
  belongs_to :band
  belongs_to :reponsibile_user, optional: true
end
