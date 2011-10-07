FactoryGirl.define do
  factory :form_template do
    name "SomeTemplate"
    description "This is SomeTemplate"
    contents <<-EOF
      <p><input type="text" value=""></p>
    EOF
    ror_contents <<-EOF
      <p><input name="filled_form[input0]" type="text" id="filled_form_input0" value=""></p>
    EOF
  end
end