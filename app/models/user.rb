class User < ApplicationRecord
  has_secure_password
  validates :name, length: { minimum: 4 }, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
end
