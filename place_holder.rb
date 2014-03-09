Examples:
    | name | address | email | pay_type |
| Cheezy | 123 Main St | cheezy@example.com| Credit card |
| Joseph | 555 South St| joe@guru.com | Check |
| Jared | 234 Leandog | doc@dev.com | Purchase order|



    Scenario Outline: Adopting two puppies
When I click the first View Details button
And I click the Adopt Me! button
And I click the Adopt Another Puppy button
And I click the second View Details button
And I click the Adopt Me! button
And I click the Complete the Adoption button
And I enter <name> in the name field
And I enter <address> in the address field
And I enter <email> in the email field
And I select <pay_type> from the pay with dropdown
And I click the Place Order button
Then I should see "Thank you for adopting a puppy!"

Examples:
    | name  | address     | email            | pay_type      |
| Marty | 123 Oak St  | marty@example.com| Credit card   |
| Frank | 555 South St| frank@guru.com   | Check         |
| Joe   | 234 Leandog | joe@dev.com      | Purchase order|


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

And(/^I enter (\d+) Main in the address field$/) do  |address|
  @browser.text_field(:id => 'order_address').set(address)
end

And(/^I enter cheezy@domain\.com in the email field$/) do |email|
  @browser.text_field(:id => 'order_email').set(email)
end

And(/^I select Check from the pay with dropdown$/) do  |pay_type|
  @browser.select_list(:id => 'order_pay_type').select(pay_type)
end

And(/^I click the Place Order button$/) do
  @browser.button(:value => 'Place Order').click
end

Then(/^I should see "(.*?)"$/) do |arg1|
  fail unless @browser.text.include? "Thank you for adopting a puppy!"
end




    Then(/^I should see "Thank you for adopting a puppy!"$/) do
      fail unless @browser.text.include? "Thank you for adopting a puppy!"
    end