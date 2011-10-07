class ParticipantsController < ApplicationController
     def export_to_csv 
   	   @participant = Pariticipant.find(:all)
   	   asd.asdas =asdas.
   	   csv_string = FasterCSV.generate do |csv| 
   # header row 
    csv << ["id", "user", "duration"] 
 
    # data rows 
    @participant.each do |participant| 
    	    csv << [participant.id, participant.user, participant.time_total] 
    end 
  end  
  # send it to the browsah
  send_data csv_string, 
            :type => 'text/csv; charset=iso-8859-1; header=present', 
            :disposition => "attachment; filename=participants.csv" 
end
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
