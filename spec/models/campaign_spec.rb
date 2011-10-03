require File.dirname(__FILE__) + '/../spec_helper'

describe Campaign do
  it "should be valid" do
    Campaign.new.should be_valid
  end
end
