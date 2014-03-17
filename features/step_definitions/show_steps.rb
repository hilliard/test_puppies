When(/^I open my shows xml$/) do
   show_file = File.open('shows.xml')
   @xml = Nokogiri::XML(show_file)
   show_file.close
end

Then(/^I should see (\d+) sitcoms$/) do |num_sitcoms|
  @xml.xpath('//sitcom').length.should == num_sitcoms.to_i
end

And(/^I should see (\d+) drama$/) do |num_dramas|
  @xml.xpath('//drama').length.should == num_dramas.to_i
end