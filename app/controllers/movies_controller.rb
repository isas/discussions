class MoviesController < ApplicationController

  def index
    @subjects = Movie.all
    render :template => "/subjects/index"
  end

  def show
    @subject = Movie.find(params[:id])
    render :template => "/subjects/show"
  end

  def new
    @subject = Movie.new
    render :template => "/subjects/new"
  end

  def edit
    @subject = Movie.find(params[:id])
  end

  def create
    @subject = Movie.new(params[:movie])
    @subject.user = current_user
    if @subject.save
      redirect_to(@subject, :notice => 'Movie was successfully created.') 
    else
      render :template => "/subjects/new"
    end
  end

  def update
    @subject = Movie.find(params[:id])
    if @subject.update_attributes(params[:subject])
      redirect_to(@subject, :notice => 'Movie was successfully updated.')
    else
      render :action => "edit" 
    end

  end

  def destroy
    @subject = Movie.find(params[:id])
    @subject.destroy
    redirect_to(movies_url)
  end
end

