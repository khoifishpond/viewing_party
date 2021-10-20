class Party < ApplicationRecord
  belongs_to :host, class_name: 'User'

  has_many :party_guests
  has_many :users, through: :party_guests

  validates :start_time, presence: true
  validates :date, presence: true
  validates :duration, numericality: { only_integer: true }, presence: true
  validates :movie_id, presence: true

  def find_host(user_id)
    User.find(user_id)
  end
end
