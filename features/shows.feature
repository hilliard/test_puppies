Feature: using xml in my cukes

  Scenario: find the number of sitcoms and dramas
    When I open my shows xml
    Then I should see 2 sitcoms
    And I should see 1 drama
