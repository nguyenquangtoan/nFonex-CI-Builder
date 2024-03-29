require 'spec_helper'

describe "reports/index.html.haml" do
  before(:each) do
    assign(:reports, [
      stub_model(Report,
        :participant_id => 1
      ),
      stub_model(Report,
        :participant_id => 1
      )
    ])
  end

  it "renders a list of reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
