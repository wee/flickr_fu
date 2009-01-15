require File.dirname(__FILE__) + '/../spec_helper'

describe Flickr::Contacts do
  
  before :each do
    @flickr = SpecHelper.flickr
  end
  
  describe ".get_list" do
    it "should return all private and public contacts for the authorized user"
  end
  
  describe ".get_public_list" do
    it "should return public contacts for the given user"
  end
end