Feature:  I want to create an xml file that contains phone numbers

  Scenario: find a phone number from a collection
    Given I have a phone book:
         | name   | phone    |
         | Cheezy | 555-5309 |
         | Sneezy | 123-4321 |
         | Wheezy | 908-9999 |
         | Sleezy | 666-6666 |
         | Freezy | 333-3333 |

    When I look up the phone number for "Sneezy"
    Then I should see the phone number "123-4321"