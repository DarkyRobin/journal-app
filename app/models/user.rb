class User < ApplicationRecord
  has_many :categories
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates_confirmation_of :password
  has_secure_password
end
