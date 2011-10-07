require 'spec_helper'

describe "reports/edit.html.haml" do
  before(:each) do
    @report = assign(:report, stub_model(Report,
      :participant_id => 1
    ))
  end

  it "renders the edit report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reports_path(@report), :method => "post" do
      assert_select "input#report_participant_id", :name => "report[participant_id]"
    end
  end
end
