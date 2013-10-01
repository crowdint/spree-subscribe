require 'spec_helper'

describe 'spree_subscribe:reorders:create' do
  include_context 'rake'

  before do
    FactoryGirl.create :subscription_for_reorder
    FactoryGirl.create :subscription_for_reorder, reorder_on: 1.day.ago
  end

  context 'When exists active subscription' do
    before do
      subject.invoke
    end

    it 'should reorder all' do
      Spree::Subscription.all.each{ |s| s.new_order }
    end
  end
end
