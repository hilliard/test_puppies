require_relative 'error_panel'

class CheckoutPage
  include PageObject
  include DataMagic
  include ErrorPanel

  DEFAULT_DATA2 = {
      'name' => 'cheezy',
      'address' => '123 Main',
      'email' => 'cheezy@example.com',
      'pay_type' => 'Purchase order'
  }

  DEFAULT_DATA = {
    'name' => Faker::Name.name,
    'address' => Faker::Address.street_address,
    'email' => Faker::Internet.email,
    'pay_type' => 'Credit card'
   }


  text_field(:name, :id => "order_name")
  text_field(:address, :id => "order_address")
  text_field(:email, :id => "order_email")
  select_list(:pay_type, :id => "order_pay_type")
  button(:place_order, :value => "Place Order")


  def checkout(data = {})
    #populate_page_with DEFAULT_DATA.merge(data)
    populate_page_with data_for(:checkout_page, data)
    place_order
  end

  def checkout2(data= {})
    data = DEFAULT_DATA.merge(data)
    self.name = data['name']
    self.address = data['address']
    self.email = data['email']
    self.pay_type = data['pay_type']
    place_order
  end

end
