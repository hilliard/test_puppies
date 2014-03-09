Then(/^I should see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I enter Joseph in the name field$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter (\d+) South St in the address field$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I enter joe@guru\.com in the email field$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I select Check from the pay with dropdown$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter Jared in the name field$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter (\d+) Leandog in the address field$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I enter doc@dev\.com in the email field$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I select Purchase order from the pay with dropdown$/) do
  pending # express the regexp above with the code you wish you had
end















Given(/^I am on the puppy adoption site$/) do
  @browser.goto 'http://puppies.herokuapp.com'
end

When(/^I click the first View Details button$/) do
  @browser.button(:value => 'View Details', :index => 0).click
end

And(/^I click the Adopt Me! button$/) do
  @browser.button(:value => 'Adopt Me!').double_click
end

And(/^I click the Complete the Adoption button$/) do
  @browser.button(:value => 'Complete the Adoption').click
end

And(/^I enter Cheezy in the name field$/) do  |name|
  @browser.text_field(:id => 'order_name').set(name)
end

And(/^I enter (\d+) Main St in the address field$/) do |address|
  @browser.text_field(:id => 'order_address').set(address)
end

And(/^I enter cheezy@example\.com in the email field$/) do  |email|
  @browser.text_field(:id => 'order_email').set(email)
end


And(/^I select Credit card from the pay with dropdown$/) do |pay_type|
  @browser.select_list(:id => 'order_pay_type').select(pay_type)
end
sleep 5

And(/^I click the Place Order button$/) do
  @browser.button(:value => 'Place Order').click
end

Then(/^I should see "(.*?)"$/) do |arg1|
  fail unless @browser.text.include? "Thank you for adopting a puppy!"
end


When(/^I click the first View Details button$/) do
  @browser.button(:value => 'View Details', :index => 1).click
end

And(/^I click the Adopt Me! button$/) do
  @browser.button(:value => 'Adopt Me!').double_click
end

And(/^I click the Complete the Adoption button$/) do
  @browser.button(:value => 'Complete the Adoption').click
end


And(/^I enter Joseph in the name field$/) do  |name|
  @browser.text_field(:id => 'order_name').set(name)
end


And(/^I enter (\d+) South St in the address field$/) do |address|
  @browser.text_field(:id => 'order_address').set(address)
end

And(/^I enter joe@guru\.com in the email field$/) do  |email|
  @browser.text_field(:id => 'order_email').set(email)
end

And(/^I select Check from the pay with dropdown$/) do |pay_type|
  @browser.select_list(:id => 'order_pay_type').select(pay_type)
end
sleep 5
And(/^I click the Place Order button$/) do
  @browser.button(:value => 'Place Order').click
end

Then(/^I should see "(.*?)"$/) do |arg1|
  fail unless @browser.text.include? "Thank you for adopting a puppy!"
end


When(/^I click the first View Details button$/) do
  @browser.button(:value => 'View Details', :index => 2).click
end

And(/^I click the Adopt Me! button$/) do
  @browser.button(:value => 'Adopt Me!').double_click
end

And(/^I click the Complete the Adoption button$/) do
  @browser.button(:value => 'Complete the Adoption').click
end

And(/^I enter Jared in the name field$/) do  |name|
  @browser.text_field(:id => 'order_name').set(name)
end


And(/^I enter (\d+) Leandog in the address field$/) do |address|
  @browser.text_field(:id => 'order_address').set(address)
end


And(/^I enter doc@dev\.com in the email field$/) do  |email|
  @browser.text_field(:id => 'order_email').set(email)
end


And(/^I select Purchase order from the pay with dropdown$/) do |pay_tyoe|
  @browser.select_list(:id => 'order_pay_type').select(pay_type)
end

sleep 5
And(/^I click the Place Order button$/) do
  @browser.button(:value => 'Place Order').click
end

Then(/^I should see "(.*?)"$/) do |arg1|
  fail unless @browser.text.include? "Thank you for adopting a puppy!"
end
