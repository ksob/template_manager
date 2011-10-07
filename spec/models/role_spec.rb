require 'spec_helper'

describe Role do
  
  before(:each) do
    @attr = { :name => "Example Role"}
  end
  
  it "should create a new instance given valid attributes" do
    Role.create!(@attr)
  end
  
  it "should require a name" do
    no_name = Role.new(@attr.merge(:name => ""))
    no_name.should_not be_valid
  end
  
end
