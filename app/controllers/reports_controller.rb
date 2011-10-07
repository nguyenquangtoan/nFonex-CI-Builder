class ReportsController < InheritedResources::Base
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
   	   #@participant = Participant.all
   	   @participant = Participant.get_week(2)

   	   respond_to do |wants|
	    wants.html
	    wants.csv do
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
                :disposition => "attachment; filename=users.csv"
   end
  end
  end
end
