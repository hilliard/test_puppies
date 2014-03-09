Feature: Adopting puppies
  As a puppy lover
  I want to adopt puppies
  So they can chew my furniture
  Background:
    Given I am on the puppy adoption site

  Scenario: Adopting one puppy
    When I click the View Details button for "Brook"
    And I click the Adopt Me! button
    And I click the Complete the Adoption button
    And I enter "Cheezy" in the name field
    And I enter "123 Main" in the address field
    And I enter "cheezy@example.com" in the email field
    And I select "Credit card" from the pay with dropdown
    And I click the Place Order button
    Then I should see "Thank you for adopting a puppy!"


  Scenario: Adopting two puppies
    When I click the View Details button for "Brook"
    And I click the Adopt Me! button
    And I click the Adopt Another Puppy button
    And I click the View Details button  for "Hanna"
    And I click the Adopt Me! button
    And I click the Complete the Adoption button
    And I enter "Cheezy" in the name field
    And I enter "123 Main" in the address field
    And I enter "cheezy@example.com" in the email field
    And I select "Credit card" from the pay with dropdown
    And I click the Place Order button
    Then I should see "Thank you for adopting a puppy!"

  Scenario: Validate the cart with one puppy
    When I click the View Details button for "Brook"
    And I click the Adopt Me! button
    Then I should see "Brook" as the name for line item 1
    And I should see "$34.95" as the subtotal for line item 1
    And I should see "$34.95" as the cart total

  Scenario: Adopting a puppy using a table
    When I click the View Details button for "Brook"
    And I click the Adopt Me! button
    And I click the Complete the Adoption button
    And I complete the adoption with:
    | name   | address | email              | pay_type  |
    | Cheezy | 123 Main| cheezy@example.com | Check     |
    | Joe    | 324 Oak | joe@domain.com     | Purchase order |
    Then I should see "Thank you for adopting a puppy!"



