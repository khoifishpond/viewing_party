class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, dependent: :destroy
  has_many :party_guests, dependent: :destroy
  has_many :parties, through: :party_guests

  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates :email, uniqueness: true, presence: true

  has_secure_password

  def self.find_user(id)
  end
end
