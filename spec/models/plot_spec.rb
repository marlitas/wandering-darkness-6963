require 'rails_helper'

RSpec.describe Plot do
  describe 'relationships' do
    it { should belong_to(:garden) }
    it { should have_many(:seedlings) }
    it { should have_many(:plants).through(:seedlings) }
  end
end
