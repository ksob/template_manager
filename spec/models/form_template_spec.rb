require 'spec_helper'

describe FormTemplate do
  
  before(:each) do
    @attr = { :name => "Example Template", 
      :contents => <<-EOF
        <p><input type="text" value=""></p>
      EOF
    }
  end
  
  it "should create a new instance given valid attributes" do
    FormTemplate.create!(@attr)
  end
  
  it "should require a name" do
    no_name = FormTemplate.new(@attr.merge(:name => ""))
    no_name.should_not be_valid
  end
  
end
