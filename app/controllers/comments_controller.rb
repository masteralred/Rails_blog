class CommentsController < ApplicationController

  before_action :authenticate_user!, :only => [:create]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    if @comment.save 
      redirect_to @article
    else
      @article = Article.find(params[:article_id])
      @comment_flash = 'Type something in the field (minimum 3 chars)'
      render "articles/show"
    end
    
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body)
  end
end
