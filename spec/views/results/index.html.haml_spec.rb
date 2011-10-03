require 'spec_helper'

describe "results/index.html.haml" do
  before(:each) do
    assign(:results, [
      stub_model(Result),
      stub_model(Result)
    ])
  end

  it "renders a list of results" do
    render
  end
end
