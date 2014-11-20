require 'rails_helper'

RSpec.describe Purchase, :type => :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:customer) }
  end

  describe 'Validations' do

    [:amount, :customer_id, :deal_id].each do |field|
      it { is_expected.to validate_presence_of(field) }
    end
  end
  describe 'factory' do
    it "has a factory that should create successfully" do
      purchase = FactoryGirl.create(:purchase)
      expect(purchase).not_to be_nil
    end
  end
end
