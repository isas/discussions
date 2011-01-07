class MusicArtistsController < ApplicationController

  def index
    @subjects = MusicArtist.all
    render :template => "/subjects/index"
  end

  def show
    @subject = MusicArtist.find(params[:id])
    render :template => "/subjects/show"
  end

  def new
    @subject = MusicArtist.new
    render :template => "/subjects/new"
  end

  def edit
    @subject = MusicArtist.find(params[:id])
  end

  def create
    @subject = MusicArtist.new(params[:music_artist])
    @subject.user = current_user
    if @subject.save
      redirect_to(@subject, :notice => 'Music artist was successfully created.') 
    else
      render :template => "/subjects/new"
    end
  end

  def update
    @subject = MusicArtist.find(params[:id])
    if @subject.update_attributes(params[:music_artist])
      redirect_to(@subject, :notice => 'Music artist was successfully updated.')
    else
      render :action => "edit" 
    end

  end

  def destroy
    @subject = MusicArtist.find(params[:id])
    @subject.destroy
    redirect_to(music_artists_url)
  end
end

