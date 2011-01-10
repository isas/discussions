# Controller for handling subject comments
class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
    @comment_new = Comment.new
    @comment_new.subject_id = @comment.subject_id
    render "show", :layout => false
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to @comment 
    else
      render :partial => "new", :locals => {:comment => @comment}
    end
  end

#  def destroy
#    @comment = Comment.find(params[:id])
#    @comment.destroy
#  end
end
