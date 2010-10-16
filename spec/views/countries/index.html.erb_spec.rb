require 'spec_helper'

describe "countries/index.html.erb" do
  before(:each) do
    assign(:countries, [
      stub_model(Country),
      stub_model(Country)
    ])
  end

  it "renders a list of countries" do
    render
  end
end
