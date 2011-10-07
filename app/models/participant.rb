class Participant < ActiveRecord::Base
  belongs_to :campaign
  attr_accessor :num_week	
  
  
  def self.recent(number)
  	  self.find :all, :limit => number ,:order=> 'created_at desc'     
  end
  
  def self.total_on(date)  
  	  where("date(created_at) = ?",date).count
  end
  
  def self.total_participant_on(date)  
  	  Participant.find(:all, :group=>'user', :conditions => ["date(created_at) = ?", date]).count

  end
  
  def self.get_week(number)
  	  start_day = DateTime.civil(2011, 9, 19 , 0, 0, 0, 0)
  	  end_day = start_day.end_of_week()
  	  if number > 1
  	  	  (number-1).times do
  	  	  	  start_day = start_day.next_week()
  	  	  end
  	  	  end_day = start_day.end_of_week()
  	  end
  	  list = Participant.find(:all, :conditions => ["created_at between ? and ?",start_day, end_day],:limit=> 3, :order=> 'time_total asc', :group => 'user')
  	  list.each do |l|
  	  	  l.num_week = number
  	  end
  end
  
  def self.get_top_week(number)
  	list = get_week(number)
  end

  def self.count_week
  	  start_day = DateTime.civil(2011, 9, 19 , 0, 0, 0, 0)
  	  end_day = DateTime.now
  	  duration = (((end_day - start_day).to_i).to_f/7.to_f).to_i+1
  end
  
  def self.get_winner  	  
  	  i = 1
  	  list = get_top_week(1)
  	  (count_week-1).times do
  	  	  i+=1
  	  	  list+= get_top_week(i)
  	  end
  	  return list
  end
  def self.top_participant(number)
  	  #Participant.find :all, :limit=> number, :order=> 'time_total asc', :select => 'distinct(user)'
  	  Participant.find :all, :limit=> number, :order=> 'time_total asc', :select => 'distinct(user)'
  end
end
