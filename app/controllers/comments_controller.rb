class CommentsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to article_path(@article) }
      else
        format.html { redirect_to root_path, alert: @comment.errors.messages }
      end
    end
  end

  def destroy
     @article = Article.find(params[:article_id])
     @comment = @article.comments.find(params[:id])
     @comment.destroy
     redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
