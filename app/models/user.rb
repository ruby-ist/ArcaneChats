class User < ApplicationRecord
  before_commit {self.name = self.name.downcase!}
  validates :name, uniqueness: { message: "That username is already taken"}
  validates :name, presence: { message: "Username cannot be empty!"}
  validates :password, presence: { message: "Password cannot be empty"}
  has_secure_password
end
