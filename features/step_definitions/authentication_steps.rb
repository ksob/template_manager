Given /^I am registered$/ do
  @registered_user = @current_user = RailsAdmin::AbstractModel.new("User").create(
      :email => "user@test.com",
      :password => "my_password"
  )
end

Given /^I am admin$/ do
  @registered_user.make_admin
end

Given /^I am logged in as admin$/ do
  steps %Q{
    Given I am registered
    And I am admin
    And I am on the homepage
    When I go to the sign in page
    And I sign in as "user@test.com/my_password"
  }
end

Given /^I am logged in as standard user$/ do
  steps %Q{
    Given I am registered
    And I am on the homepage
    When I go to the sign in page
    And I sign in as "user@test.com/my_password"
  }
end