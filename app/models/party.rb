class Party < ApplicationRecord
  belongs_to :host, class_name: 'User'

  has_many :party_guests
  has_many :users, through: :party_guests

  validates :start_time, presence: true
  validates :date, presence: true
  validates :duration, numericality: { only_integer: true }, presence: true
end
