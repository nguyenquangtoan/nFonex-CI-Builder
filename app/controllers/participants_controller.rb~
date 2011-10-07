class ParticipantsController < ApplicationController
  def index
   @search = Participant.search(params[:search])
   @participant = @search.order("created_at DESC").page(params[:page]).per(8)
  end

  def start
  	  @participant = Participant.new
  end

  def go
  	  @participant = Campaign.find(params[:id])
  end

  def create
    @participant = Participant.new(params[:participant])
    if @participant.save
      redirect_to @participant, :notice => "Successfully created campaign."
    else
      render :action => 'new'
    end
  end
  
  def finish
  end

  def result
  end

end
