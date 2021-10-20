require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe 'runtime_conversion' do
    it 'converts minutes into hours and minutes' do
      minutes = 156

      expect(runtime_conversion(minutes)).to eq("2 hour(s) 36 minute(s)")
    end
  end
end
