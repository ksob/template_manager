Feature: lists available form templates

  As an authorized user
  I want to see all my filled forms
  So that I can review and correct them if needed

  Scenario: User has not filled any form yet
    Given I am logged in as standard user
    And I have not filled in any form yet
    When I am on the home page
    Then I should not see "Your Filled Forms"

  Scenario: User filled one form before
    Given I am logged in as standard user
    And I have filled in the following form template:
      | Name        |
      | TemplateXYZ |
    When I am on the home page
    Then I should see "Your Filled Forms" on the "Right side"
    And I should see "TemplateXYZ" on the "Right side"

  Scenario: User filled two forms before
    Given I am logged in as standard user
    And I have filled in the following form template:
      | Name          |
      | TemplateXYZ   |
      | Template ABCD |
    When I am on the home page
    Then I should see "Your Filled Forms" on the "Right side"
    And I should see "Template ABCD" on the "Right side"