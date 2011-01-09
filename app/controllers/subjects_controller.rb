class SubjectsController < ApplicationController  
  @subject_class = Subject
  @subject_path = :subjects_path
  
  class << self
    attr_accessor :subject_class, :subject_path
  end
  
  def index
    puts subject_class
    if params[:user_id]
      @subjects = subject_class.where_user_id(params[:user_id])
    else
      @subjects = subject_class.ordered
    end
    render :template => "/subjects/index"
  end

  def show
    @subject = subject_class.find(params[:id])
    render :template => "/subjects/show"
  end

  def new
    @subject = subject_class.new
    render :template => "/subjects/new"
  end

  def edit
    @subject = subject_class.find(params[:id])
    render :edit
  end

  def create
    @subject = subject_class.new(params[:subject])
    if @subject.save
      redirect_to(@subject, :notice => 'Subject was successfully created.') 
    else
      render :template => "/subjects/new" 
    end
  end

  def update
    @subject = subject_class.find(params[:id])
    if @subject.update_attributes(params[:subject])
      redirect_to(@subject, :notice => 'Subject was successfully updated.')
    else
      render :template => "/subjects/edit" 
    end
  end

  def destroy
    subject_class.find(params[:id]).destroy
    redirect_to path
  end
  
  protected
  # Right subjects class for child controllers 
  def subject_class
    self.class.subject_class
  end
  
  # Right subjects path for child controllers
  def path
    send self.class.subject_path
  end
end
