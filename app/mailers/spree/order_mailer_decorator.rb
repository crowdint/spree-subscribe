Spree::OrderMailer.class_eval do

  def reorder_email order
    puts 'Sending reminder subscription'
    subject = "#{Spree::Config[:site_name]} #{t('order_mailer.reorder_email.subject')}"
    body =  render 'spree/order_mailer/reorder_email', locals: { myorder: order, url: cart_url }
    mail(to:            order.email,
         from:          from_address,
         subject:       subject,
         body:          body,
         content_type:  'text/html',
         'X-No-Spam' => true)
  end
end
