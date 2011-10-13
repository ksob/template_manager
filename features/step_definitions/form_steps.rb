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

Then /^I have filled in (.+) form template with the following data:$/i do |form_template_name, table|
  form_template_id = 1
  steps %Q{
    Given the following form template exists:
      | Id                  | Name                  | Description                   | Ror_contents                                                                           |
      | #{form_template_id} | #{form_template_name} | This is #{form_template_name} | <p><input name="filled_form[input0]" type="text" id="filled_form_input0" value=""></p> |
  }
  table.hashes.each do |human_hash|
    filed_names = ""
    filed_values = ""
    human_hash.each_pair do |k, v|
      filed_names += (filed_names.empty? ? "" : "|") + " #{k} "
      filed_values += (filed_values.empty? ? "" : "|") + " #{v} "
    end
    steps %Q{
      And the following filled form exists:
        | Form_template_id    | #{filed_names}  | User_id             |
        | #{form_template_id} | #{filed_values} | #{@current_user.id} |
    }
  end
end

When /^I edit "([^"]*)" form template adding an? (.+)$/i do |form_template_name, form_elem_to_add|
  form_template = FormTemplate.find_by_name(form_template_name)
  form_template.update_attributes(:contents.to_s => form_template.attributes[:contents.to_s] +=
      case form_elem_to_add
        when 'input box'
          '<label for="input_box">input box</label><input id="input_box" type="text" value="">'
      end
  )
end

When /^I fill in (\d+)(?:st|nd|rd|th) input box with "([^"]*)"/i do |index, value|
  steps %Q{
    When I fill in "#{value}" for "filled_form_input#{index.to_i-1}"
  }
end

Then /^I should see (.+) filled forms in the (.+) section?/i do |count, selector|
  with_scope(selector, :css_id) do
    page.should have_content(Time.current.to_s[0..9])
  end
end

Then /^I should see "([^"]*)"(?: in the "([^"]*)" section)?$/i do |text, selector|
  with_scope(selector, :css_id) do
    page.should have_content(text)
  end
end

Then /^I should see "([^"]*)"(?: on the "([^"]*)")$/i do |text, selector|
  with_scope(selector, :css_id) do
    page.should have_content(text)
  end
end

Then /^I click at the (\d+)(?:st|nd|rd|th) one/i do |the_filled_form_index|
  primary_menu_selector = "li[id^='primary']"
  sibling_filled_form_lvl = 1.upto(the_filled_form_index.to_i - 1).inject("") do |res, elem|
    res + " + #{primary_menu_selector}"
  end
  within("#user_filled_forms #{ primary_menu_selector }#{ sibling_filled_form_lvl }") do
    click_link(Time.current.to_s[0..9])
  end
end