class Campaign < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  has_many :participants
  belongs_to :category
  belongs_to :status
  belongs_to :user
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  named_scope :activated,      :conditions => { :status_id => "1" }
  named_scope :inactivated,    :conditions => { :status_id => "2" }
  named_scope :unreleased,    :conditions => { :status_id => "3" }
  def self.get_time
  	  Time.now
  end
  def self.find_latest(time = nil)
    r = %w( hour day week month year )
    if r.include?(time)
      self.find :all, :conditions => ['created_at > ?', 1.send(time).ago]
    else
      self.find :all
    end
  end
  def self.limit_size_sound
    	  
  end
  
  def self.set_limit_size_sound(limit_size)
    
  end
  
  def url_sound
  	  "/sounds/#{id}/"
  end  	  	  
  
  def self.recent(number)
  	  self.find :all, :limit => number ,:order=> 'created_at desc'     
  end
  
  def recent_participant(number)
  	  self.participants.find :all, :limit => number ,:order=> 'created_at desc'     
  end
  
  def top_participant(number)
  	  self.participants.find :all, :limit=> number, :order=> 'time_total asc', :select => 'distinct(user)'
  	  #self.participants.find :all, :limit=> number, :order=> 'time_total asc', :group => 'user'
  end
  
  def check_publish?
  	  self.questions.each do |question|
  	  	  return unless question.check_url_sound?
  	  	  question.answers.each do |answer|
  	  	  	  return unless answer.check_url_sound?
  	  	  end  	  	  
  	  end
  	  return true
  end
  
end
