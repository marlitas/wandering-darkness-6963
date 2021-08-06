require 'rails_helper'

RSpec.describe Plant do
  describe 'relationships' do
    it { should have_many(:seedlings) }
    it { should have_many(:plots).through(:seedlings) }
  end
end
