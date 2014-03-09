Given(/^I have no cheese$/) do
 puts "I'm so sad. I have no cheese :-("
end

When(/^I press the make "(.*?)" cheese button$/) do |type|
    puts "I pressed the make "  + type + " cheese button"
end

Then(/^I should see the "(.*?)" message$/) do |message|
   puts message
end


