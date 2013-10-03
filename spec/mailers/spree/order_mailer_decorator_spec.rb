require 'spec_helper'

describe Spree::OrderMailer do
  describe '#reorder_email' do
    let(:order) { create :order_with_line_items }
    let(:subject) { Spree::OrderMailer }
    let(:email_subject) { "Spree Demo Site reminder subscription payment" }
    let(:email_body) do
      I18n.t('order_mailer.reorder_email.body_html',
             site_link: '<a href="http://localhost:3000/cart">here</a>')
    end

    it 'should send a reorder email' do
      email = subject.reorder_email(order)

      expect(email.subject).to eql(email_subject)
      expect(email.body).to match(email_body)
    end
  end
end
