FactoryGirl.define do
  # DD: 'product' comes from Spree core, simple_product no longer exists
  factory :subscribable_product, :parent => :product do
    subscribable true
  end
end
