Feature: handles multiple versions of form templates

  As an authorized user
  I want to preserve previous form templates' contents when they are edited
  So that the previously filled forms relying on them will not be broken

  Scenario: User filled one form before
    Given I am logged in as standard user
    And I have filled in TemplateXYZ form template with the following data:
      | Input0 | Notes              |
      | val X  | This is my note... |
    When I edit "TemplateXYZ" form template adding an input box
    And I go to the home page
    And I follow "Show" for form_template whose name is "TemplateXYZ"
    And I fill in 1st input box with "val Y"
    And I press "Submit"
    And I go to the home page
    Then I should see two filled forms in the user_filled_forms section

    # The 1st one should point to the old version of the template
    When I click at the 1st one
    Then the "filled_form[input0]" field should contain "val X"

    And I go to the home page

    # The 2nd one should point to the new version of the template
    When I click at the 2nd one
    Then the "filled_form[input0]" field should contain "val Y"
