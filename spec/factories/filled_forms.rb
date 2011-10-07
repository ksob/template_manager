FactoryGirl.define do
  factory :filled_form do
    form_template_id {Factory.create(:form_template).id}
    input0 "MyValue"
    notes "Please note that..."
  end
end