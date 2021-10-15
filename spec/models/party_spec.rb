require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'Associations' do
    it { should belong_to(:host) }
    it { should have_many(:party_guests) }
    it { should have_many(:users).through(:party_guests)}
  end
end
