class Message < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :send_to, class_name: 'User'

  after_save_commit { broadcast_append_to "messages" }
end
