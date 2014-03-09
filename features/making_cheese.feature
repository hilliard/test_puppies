Feature: Making cheese
  As a cheese maker
  I want to make cheese
  So I can share my cheesiness
  Background:
  Given  I have no cheese

  Scenario Outline: Using the cheese machine
    When I press the make "<type>" cheese button
    Then I should see the "<message>" message

  Examples:
  | type    | message               |
  | Swiss   | I love Swiss cheese   |
  | Blue    | I love Blue cheese    |
  | Cheddar | I love Cheddar cheese |
