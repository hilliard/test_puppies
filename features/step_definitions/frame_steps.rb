Given(/^I am on the frames page$/) do
  visit_page(FramesPage)
end

When(/^I send the text "([^"]*)"$/) do |text|
 on_page(FramesPage).send_message(text)
end

Then(/^the receiver should have "([^"]*)"$/) do |expected|
  on_page(FramesPage).receiver.should == expected
end

When(/^I popup the alert$/) do
  on_page(FramesPage) do |page|
    @alert_text = page.alert_text
  end
end

Then(/^the text from the alert should read "([^"]*)"$/) do |expected|
  @alert_text.should == expected
end

When(/^I popup the confirm$/) do
  on_page(FramesPage ) do |page|
    @confirm_text = page.confirm_text
  end
end

Then(/^the text from the confirm should read "([^"]*)"$/) do |expected|
  @confirm_text == expected
end

When(/^I popup the prompt and enter "([^"]*)"$/) do |value_to_enter|
  on_page(FramesPage) do |page|
   puts "Value: " + value_to_enter
   @prompt_response = page.prompt_value(value_to_enter)
  end
end

Then(/^the message from the prompt should read "([^"]*)"$/) do |message|
  puts "Prompt Message " + message
  @prompt_response[:message].should == message
end

And(/^the default value from the prompt should be "([^"]*)"$/) do |default|
  @prompt_response[:default_value].should == default
end

When(/^I popup a window$/) do
  on_page(FramesPage).popup_a_window
end

Then(/^I should be on a page with the text "([^"]*)"$/) do |expected|
  @current_page.text.should include expected
end

And(/^I should be able to close the popup and return to the original window$/) do
  on_page(FramesPage).return_from_popup
end