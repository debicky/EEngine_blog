class CommentsController < ApplicationController
  before_action :set_post
  before_action :authenticate_author!


  def create
    @comment = @post.comments.new(comments_params)
    @comment.author = current_author
    @comment.save
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
  end



  private
  def comments_params
    params.require(:comment).permit(:body, :post_id)
  end

  def set_post
    @post = Post.friendly.find(params[:post_id])
  end
end
