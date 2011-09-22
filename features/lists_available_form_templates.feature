@sql-only
Feature: lists available form templates

  So that I can fill form templates
  As an authorized user
  I want to see available form templates

  Scenario: None form template available
    Given the following form template exists:
      | Name | Description |
    When I am on the home page
    Then I should not see "Show"
    # "Show" button accompanies every form template

  Scenario: One form template available
    Given the following form template exists:
      | Name         | Description          |
      | SomeTemplate | This is SomeTemplate |
    When I am on the home page
    Then I should see "SomeTemplate"

  Scenario: Two form templates available
    Given the following form template exists:
      | Name              | Description               |
      | SomeTemplate      | This is SomeTemplate      |
      | SomeOtherTemplate | This is SomeOtherTemplate |
    When I am on the home page
    Then I should see "SomeTemplate"
    And I should see "SomeOtherTemplate"