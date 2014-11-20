require 'spec_helper'

RSpec.describe Vendor, :type => :model do
  describe 'Associations' do
    it { is_expected.to have_many(:deals) }
  end
end
