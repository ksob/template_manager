require 'spec_helper'

describe "form_templates/index.html.erb" do
  before(:each) do
    assign(:form_templates, [
      stub_model(FormTemplate,
        :name => "Name",
        :description => "MyText",
        :contents => "MyText",
        :ror_contents => "MyText"
      ),
      stub_model(FormTemplate,
        :name => "Name",
        :description => "MyText",
        :contents => "MyText",
        :ror_contents => "MyText"
      )
    ])
  end

  it "renders a list of form_templates" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
  end
end
