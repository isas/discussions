class SubjectsController < ApplicationController

  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def create
    @subject = Subject.new(params[:subject])

    if @subject.save
      redirect_to(@subject, :notice => 'Subject was successfully created.') 
    else
      render :action => "new" 
    end
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(params[:subject])
      redirect_to(@subject, :notice => 'Subject was successfully updated.')
    else
      render :action => "edit" 
    end

  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    redirect_to(subjects_url)
  end
end
