require 'spec_helper'

describe PagesController do

  render_views
  integrate_views

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end

    it "returns http success" do
      get 'home'
      response.should have _selector("title", 
                          :content => "Ruby on Rails Tutorial Sample App | Home")     
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end

        it "should have right title" do
      get 'contact'
      response.should have _selector("title", 
                          :content => "Ruby on Rails Tutorial Sample App | Contact")     
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
        it "should have right title" do
      get 'about'
      response.should have _selector("title", 
                          :content => "Ruby on Rails Tutorial Sample App | About")     
    end
  end

end
