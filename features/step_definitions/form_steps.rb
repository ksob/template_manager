When /^I have not filled in any form yet$/i do
end

Then /^I have filled in the following form templates?:$/i do |table|
  table.hashes.each_with_index do |human_hash, idx|
    attributes = convert_human_hash_to_attribute_hash(human_hash, FactoryGirl.factories['form_template'].associations)
    steps %Q{
    Given the following form template exists:
      | Id       | Name                 | Description                  | Ror_contents                                                                           |
      | #{idx+1} | #{attributes[:name]} | This is #{attributes[:name]} | <p><input name="filled_form[input0]" type="text" id="filled_form_input0" value=""></p> |
    And the following filled form exists:
      | Form_template_id | Input0         | Notes              | User_id             |
      | #{idx+1}         | my input value | This is my note... | #{@current_user.id} |
    }
  end
end

Then /^I should see "([^"]*)"(?: in the "([^"]*)" section)?$/i do |text, selector|
  with_scope(selector,:css_id) do
    page.should have_content(text)
  end
end

Then /^I should see "([^"]*)"(?: on the "([^"]*)")$/i do |text, selector|
  with_scope(selector, :css_id) do
    page.should have_content(text)
  end
end
