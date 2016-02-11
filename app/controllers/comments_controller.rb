class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    if @comment.save 
      redirect_to @article
    else
      redirect_to @article
    end
    
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
