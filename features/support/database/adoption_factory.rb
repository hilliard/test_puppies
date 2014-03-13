require_relative 'puppy'

World(FactoryGirl::Syntax::Methods)
# Save instance
#order = create(:order)

#Unsaved instance
#order = build(:order)

#Override default values
#order = create(:order, :name => 'Joe')

FactoryGirl.define do
  factory :order do
    name 'Cheezy'
    address '123 Main St.'
    email 'cheezy@me.com'
    pay_type 'Check'
  end

  factory :adoption do
    association :order
    puppy Puppy.find_by_name('Hanna')
  end
end

