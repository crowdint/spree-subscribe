require 'spec_helper'

describe 'spree_subscribe:reorders:create' do
  include_context 'rake'

  let!(:today_subscription) do
    FactoryGirl.create :subscription_for_reorder,
      state:            'active',
      times:            1,
      time_unit:        1,
      billing_address:  FactoryGirl.create(:address),
      shipping_address: FactoryGirl.create(:address)
  end
  let!(:yesterday_subscription) do
    FactoryGirl.create :subscription_for_reorder, reorder_on: 1.day.ago,
      state:            'active',
      times:            1,
      time_unit:        1,
      billing_address:  FactoryGirl.create(:address),
      shipping_address: FactoryGirl.create(:address)
  end

  context 'When active subscription exist' do
    before do
      Spree::Subscription.any_instance.stub(:complete_reorder).and_return true
      subject.invoke
      today_subscription.reload
      yesterday_subscription.reload
    end

    it 'reorders all' do
      expect(today_subscription.reorder_on).to eql(Date.today + 1.day)
      expect(yesterday_subscription.reorder_on).to eql(Date.today)
    end
  end
end
