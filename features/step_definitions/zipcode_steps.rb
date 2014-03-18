When(/^I ask the service for the supported operations$/) do
  @operations = using(ZipCodeInformationService).operations
end

Then(/^"([^"]*)" should be supported$/) do |operation|
  @operations.should include operation.to_sym
end

When(/^I ask for the zip code information for "([^"]*)"$/) do |zip_code|
  using(ZipCodeInformationService).get_info_by_zip('USZip' => zip_code)
end

Then(/^I should get the following information:$/) do |table|
  # table is a table.hashes.keys # => [:city, :state, :area_code, :time_zone]
  expected = table.hashes.first
  using(ZipCodeInformationService) do |service|
    #service.city.should == expected['city']
    service.response_for(:city).should == expected['city']
    #service.state.should == expected['state']
    service.response_for(:state).should == expected['state']
    #service.area_code.should == expected['area_code']
    service.response_for(:area_code).should == expected['area_code']
    #service.time_zone.should == expected['time_zone']
    service.response_for(:time_zone).should == expected['time_zone']
  end
end