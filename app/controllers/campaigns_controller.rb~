class CampaignsController < ApplicationController
	before_filter :authenticate_user! , :only => [:create, :new, :edit]                   
  def index
    @search = Campaign.search(params[:search])
    @campaigns = @search.order("created_at DESC").page(params[:page]).per(8)
    if params[:status_id]
    	    @campaigns =@search.where(:status_id => params[:status_id]).order("created_at DESC").page(params[:page]).per(8)
	end
	if params[:category_id]
		@campaigns =@search.where(:category_id => params[:category_id]).order("created_at DESC").page(params[:page]).per(8)
	end
  end

  def show
    @campaign = Campaign.find(params[:id])
    @participant = Participant.where(:campaign_id=>params[:id])
  end
  
  def start
    @campaign = Campaign.find(params[:id])
  end
  
  def go
    @campaign = Campaign.all
    @time_now = Time.now
  end

  def new
    @campaign = Campaign.new
    3.times do
    	    question = @campaign.questions.build
    	    4.times { question.answers.build }
  end
  end

  def create
    @campaign = current_user.campaigns.new(params[:campaign])    
    @campaign.questions.each_with_index do |question,index|
    	    question.url_question = "/audios/q#{Question.last.id+index+1}"
    	    question.answers.each_with_index do |answer,index|
    	    	    answer.url_answer = "/audios/a#{Answer.last.id+index+1}"
    	    end
    	    end
    if @campaign.save    	    
      redirect_to @campaign, :notice => "Successfully created campaign."
    else
      render :action => 'new'
    end
  end

  def edit
    @campaign = Campaign.find(params[:id])
    @campaign.questions.each_with_index do |question,index|
    	    question.url_question = "/audios/q#{question.id}"
    	    question.answers.each do |answer|
    	    	    answer.url_answer = "/audios/a#{answer.id}"
    	    end
    	    end
  end

  def update
    @campaign = Campaign.find(params[:id])    
    if params["save.x"]            	        	    	    
    end    
    if params["save_publish.x"] #&& check_publish?
    	    check_url = true
    	    params[:campaign][:questions_attributes].each do |key,value|
    	    	    value.each do |key1,value1|
    	    	    	    if key1=="url_question"
    	    	    	    	    unless FileTest.exists?(value1)
    	    	    	    	    	    check_url = false 
    	    	    	    	    	    break
    	    	    		    end
    	    	    	    end
    	    	    	    if key1 == "answers_attributes"
    	    	    	    	    value1.each do |key2,value2|
    	    	    	    	    	    if key1=="url_answer"
    	    	    	    	    	  	  unless FileTest.exists?(value2)
    	    	    	    	    	  	  	  check_url = false 
    	    	    	    	    	  	  	  break
    	    	    	    	    	  	  end
    	    	    	    	    	  end  
    	    	    	    	    end
    	    	    	    end
    	    	    	    break unless check_url
    	    	    end 
		    break unless check_url   	    	    
    	    end
    	    if check_url
    	    	    params[:campaign][:status_id] = "1"
    	    else
    	    	    params[:campaign][:status_id] = "3"
    	    end
    end
    #@campaign.status_idas = 1
    if @campaign.update_attributes(params[:campaign])
      redirect_to @campaign, :notice  => "Successfully updated campaign."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    	redirect_to root_path, :notice => "Successfully destroyed campaign."
  end
end
