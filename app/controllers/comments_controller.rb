class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html {redirect_to root_path, notice: 'Your comment was saved!' }
        format.js
      else
        format.html {render root_pather, notice: 'Check the comment form, something went wrong.'}
        format.js
      end
    end
  end

  format.html { redirect_to @post, notice: 'Post was successfully created.' }
  format.json { render :show, status: :created, location: @post }
else
  format.html { render :new }
  format.json { render json: @post.errors, status: :unprocessable_entity }
end

  def destroy
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      if @comment.user_id == current_user.id
        @comment.delete
        format.html {redirect_to root_path}
        format.js
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end



end
