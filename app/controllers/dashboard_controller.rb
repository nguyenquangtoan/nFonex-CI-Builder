class DashboardController < ApplicationController
  def index
  	  @campaign = Campaign.recent(5)
  	  @participant = Participant.recent(5)
  end

end
