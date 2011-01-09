class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
    @comment_new = Comment.new
    @comment_new.subject_id = @comment.subject_id
    render "show", :layout => false
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to(@comment, :notice => 'Comment was successfully created.')
    else
      render :partial => "new", :locals => {:comment => @comment}
    end
  end

#  def destroy
#    @comment = Comment.find(params[:id])
#    @comment.destroy
#  end
end
