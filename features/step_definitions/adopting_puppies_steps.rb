Given(/^I am on the puppy adoption site$/) do
 #@browser.goto 'http://puppies.herokuapp.com'
  #@home = HomePage.new(@browser)
  visit(HomePage)
end

#When(/^I click the first View Details button$/) do |name|
  # @browser.button(:value => 'View Details', :index => 0).click
  # @home.select_puppy_number 1
  # @details = DetailsPage.new(@browser)
  # on(HomePage).select_puppy name
#end

#When(/^I click the first View Details button for "([^"]*)"$/) do |name|
#  on(HomePage).select_puppy name
#end

When(/^I click the View Details button for "(.*?)"$/) do |name|
  on(HomePage).select_puppy name
end


When(/^I click the Adopt Me! button$/) do
  # @browser.button(:value => 'Adopt Me!').click
  #@details.add_to_cart
  # @cart = ShoppingCartPage.new(@browser)
  on(DetailsPage).add_to_cart

  # puts "This is cart: " + @cart.inspect
end

When(/^I click the Complete the Adoption button$/) do
  #@browser.button(:value => 'Complete the Adoption').click
  #@cart.proceed_to_checkout
  #@checkout = CheckoutPage.new(@browser)
  on(ShoppingCartPage).proceed_to_checkout
end

And(/^I enter "(.*?)" in the name field$/) do |name|
  #@browser.text_field(:id => 'order_name').set(name)
  #@checkout.name = name
  on(CheckoutPage).name = name
end

And(/^I enter "(.*?)" in the address field$/) do |address|
  # @browser.text_field(:id => 'order_address').set(address)
  # @checkout.address = address
  on(CheckoutPage).address = address
end

And(/^I enter "(.*?)" in the email field$/) do |email|
  # @browser.text_field(:id => 'order_email').set(email)
  # @checkout.email = email
  on(CheckoutPage).email = email
end

And(/^I select "(.*?)" from the pay with dropdown$/) do |pay_type|
  # @browser.select_list(:id => 'order_pay_type').select(pay_type)
  # @checkout.pay_type = pay_type
  on(CheckoutPage).pay_type = pay_type
end

When(/^I click the Place Order button$/) do
  # @browser.button(:value => 'Place Order').click
  # @checkout.place_order
  on(CheckoutPage).place_order
end

Then /^I should see "([^"]*)"$/ do |expected|
  #@browser.text.should include expected
  @current_page.text.should include expected
end

And(/^I click the Adopt Another Puppy button$/) do
  #@browser.button(:value => 'Adopt Another Puppy').click
  #@cart.continue_shopping
  on(ShoppingCartPage).continue_shopping
end

#And(/^I click the second View Details button for "([^"]*)"$/) do  |name|
  # @browser.button(:value => 'View Details', :index => 1).click
  #@home.select_puppy_number 2
  #@details = DetailsPage.new(@browser)
#  on(HomePage).select_puppy name
#end

# And(/^I click the second View Details button  for "(.*?)"$/) do |name|
#  on(HomePage).select_puppy name
# end

And(/^I click the View Details button  for "(.*?)"$/) do |name|
  on(HomePage).select_puppy name
end

Then(/^I should see "([^"]*)" as the name for (line item \d+)$/) do |name, line_item|
  puts "Table Cell 1: " + @browser.table(:index => 0)[0][1].text
  #@browser.table(:index => 0)[0][1].text.should include arg1
  #@cart.name_for_line_item(line_item.to_i).should include name
  #@current_page.text.should include expected
  on(ShoppingCartPage).name_for_line_item(line_item).should include name
end

And(/^I should see "([^"]*)" as the subtotal for (line item \d+)$/) do |subtotal, line_item|
    puts "Table Cell 3: " + @browser.table(:index => 0)[0][3].text
    #@browser.table(:index => 0)[0][3].text.should == subtotal
    #@cart.subtotal_for_line_item(line_item.to_i).should == subtotal
    on(ShoppingCartPage).subtotal_for_line_item(line_item).should == subtotal
end

And(/^I should see "([^"]*)" as the cart total$/) do |total|
  puts "Cart Total: " + @browser.td(:class => 'total_cell').text
  # puts "TTotal: " + total
  # @browser.td(:class => 'total_cell').text.should == total
  # @cart.cart_total.should == total
  on(ShoppingCartPage).cart_total.should == total
end

And(/^I complete the adoption with:$/) do |table|
  # table is a Cucumber::Ast::Table
  on(CheckoutPage).checkout(table.hashes.last)
end

And(/^I complete the adoption using a Credit card$/) do
  on(CheckoutPage).checkout('pay_type' => 'Credit card')
end

And(/^I complete the adoption$/) do
    on(CheckoutPage).checkout
end

When(/^I complete the adoption of a puppy$/) do
  on(HomePage).select_puppy
  on(DetailsPage).add_to_cart
  on(ShoppingCartPage).proceed_to_checkout
  on(CheckoutPage).checkout
end

When(/^I checkout leaving the name field blank$/) do
  on(HomePage).select_puppy
  on(DetailsPage).add_to_cart
  on(ShoppingCartPage).proceed_to_checkout
  on(CheckoutPage).checkout('name' => "")
end

Then(/^I should see the error message "([^"]*)"$/) do |msg|
  @current_page.error_messages.should include msg
end