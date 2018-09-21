class CommentsController < ApplicationController

  def create
    cm = comment_params
    if cm[:user_attributes][:username].length == 0 
      cm.delete(:user_attributes)
    end
    comment = Comment.create(cm)
    binding.pry
    redirect_to post_path(comment.post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
