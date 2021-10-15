class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, dependent: :destroy
  has_many :parties, dependent: :destroy
  has_many :party_guests, through: :parties

  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates :email, uniqueness: true, presence: true

  has_secure_password
end
