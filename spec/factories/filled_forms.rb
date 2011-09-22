# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :filled_form do
    form_template_id {Factory.create(:form_template).id}
    input0 "MyValue"
    notes "Please note that..."
  end
end