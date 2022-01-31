class Seen < ApplicationRecord
  validates :last_seen, presence: true
  belongs_to :user
  belongs_to :other_user, class_name: 'User'
end
