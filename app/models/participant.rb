class Participant < ActiveRecord::Base
	belongs_to :campaign
  def self.recent(number)
  	  self.find :all, :limit => number ,:order=> 'created_at desc'     
  end
  def self.total_on(date)  
  	  where("date(created_at) = ?",date).count
  end  
end
