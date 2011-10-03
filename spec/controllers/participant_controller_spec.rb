require 'spec_helper'

describe ParticipantController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'start'" do
    it "should be successful" do
      get 'start'
      response.should be_success
    end
  end

  describe "GET 'go'" do
    it "should be successful" do
      get 'go'
      response.should be_success
    end
  end

  describe "GET 'finish'" do
    it "should be successful" do
      get 'finish'
      response.should be_success
    end
  end

  describe "GET 'result'" do
    it "should be successful" do
      get 'result'
      response.should be_success
    end
  end

end
