Given(/^I have a phone book:$/) do |table|
  # table is a table.hashes.keys # => [:name, :phone]
  builder = Builder::XmlMarkup.new
  @xml = builder.contacts do |contacts|
    table.hashes.each do |row|
      contacts.contact do |contact|
        contact.name row['name']
        contact.phone row['phone']
      end
    end
  end
end

When(/^I look up the phone number for "([^"]*)"$/) do |name|
  puts "Name: " + name
  doc = Nokogiri::XML(@xml)
  contacts = doc.xpath('//contact')
  @node = contacts.find {|row| row.content.include? name}
end

Then(/^I should see the phone number "([^"]*)"$/) do |phone_number|
 puts "Phone# " + phone_number
 @node.at_xpath('.//phone').content.should == phone_number
end