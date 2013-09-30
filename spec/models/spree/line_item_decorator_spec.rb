require 'spec_helper'

describe Spree::LineItem do
  let(:subscription){ FactoryGirl.create :subscription }
  let(:subject){ FactoryGirl.create :line_item_with_completed_order,
                   subscription: subscription }

  describe '#subscribed_name' do
    context 'When has a subscription' do
      it 'should return the name' do
        expect(subject.subscribed_name).to eql('3 months')
      end
    end

    context 'When does not have a susbscrption' do
      before do
        subject.stub(:subscription).and_return nil
      end

      it 'should return nil' do
        expect(subject.subscribed_name).to be_nil
      end
    end
  end
end
