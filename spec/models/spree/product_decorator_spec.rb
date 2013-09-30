require 'spec_helper'

describe Spree::Product do
  let(:subscription_interval) { FactoryGirl.create :subscription_interval }
  let(:subject) { FactoryGirl.create :subscribable_product,
                subscription_intervals: [subscription_interval] }

  describe '#subscribed_name' do
    context 'When subscription exist' do
      it 'should return the name of the subscription' do
        expect(subject.subscribed_name(subscription_interval.id)).to eql('3 Months')
      end
    end

    context 'When susbscription does not exist' do
      it 'should return nil' do
        expect(subject.subscribed_name(2)).to be_nil
      end
    end
  end
end
