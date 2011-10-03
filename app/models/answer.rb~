class Answer < ActiveRecord::Base
  belongs_to :question
  def index_answer  	  
  	  int = question.answers.index(self) + 1
  end
  
  def check_url_sound?
  	  link = "#{RAILS_ROOT}/public#{self.url_answer}.wav"
  	  FileTest.exists?(link)
  end
end
