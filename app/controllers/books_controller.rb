class BooksController < ApplicationController

  def index
    @subjects = Book.all_ordered
    render :template => "/subjects/index"
  end

  def show
    @subject = Book.find(params[:id])
    render :template => "/subjects/show"
  end

  def new
    @subject = Book.new
    render :template => "/subjects/new"
  end

  def edit
    @subject = Book.find(params[:id])
  end

  def create
    @subject = Book.new(params[:book])
    @subject.user = current_user
    if @subject.save
      redirect_to(@subject, :notice => 'Book was successfully created.') 
    else
      render :template => "/subjects/new"
    end
  end

  def update
    @subject = Book.find(params[:id])
    if @subject.update_attributes(params[:subject])
      redirect_to(@subject, :notice => 'Book was successfully updated.')
    else
      render :action => "edit" 
    end

  end

  def destroy
    @subject = Book.find(params[:id])
    @subject.destroy
    redirect_to(books_url)
  end
end
