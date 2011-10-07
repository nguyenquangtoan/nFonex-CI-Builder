require 'spec_helper'

describe "reports/new.html.haml" do
  before(:each) do
    assign(:report, stub_model(Report,
      :participant_id => 1
    ).as_new_record)
  end

  it "renders new report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => reports_path, :method => "post" do
      assert_select "input#report_participant_id", :name => "report[participant_id]"
    end
  end
end
