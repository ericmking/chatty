class Task < ApplicationRecord
  belongs_to :band
  belongs_to :responsibile_user, optional: true, class_name: 'user'
end
