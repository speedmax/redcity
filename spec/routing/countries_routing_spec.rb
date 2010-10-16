require "spec_helper"

describe CountriesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/countries" }.should route_to(:controller => "countries", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/countries/new" }.should route_to(:controller => "countries", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/countries/1" }.should route_to(:controller => "countries", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/countries/1/edit" }.should route_to(:controller => "countries", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/countries" }.should route_to(:controller => "countries", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/countries/1" }.should route_to(:controller => "countries", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/countries/1" }.should route_to(:controller => "countries", :action => "destroy", :id => "1")
    end

  end
end
