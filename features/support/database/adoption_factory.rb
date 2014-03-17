require_relative 'puppy'

World(FactoryGirl::Syntax::Methods)

FactoryGirl.define do
  factory :order do
    # name 'Cheezy'
    name Faker::Name.name
    # address '123 Main St.'
    address Faker::Address.street_address
    # email 'cheezy@me.com'
    email Faker::Internet.email
    pay_type 'Check'
  end

  factory :adoption do
    association :order
    puppy Puppy.find_by_name('Hanna')
  end
end


# Save instance
#order = create(:order)

#Unsaved instance
#order = build(:order)

#Override default values
#order = create(:order, :name => 'Joe')