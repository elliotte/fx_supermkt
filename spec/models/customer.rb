require 'spec_helper'

RSpec.describe Customer, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:purchases) }
  end
end
