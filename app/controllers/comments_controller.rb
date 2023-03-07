class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy]
  before_action :set_project, only: %i[create destroy]

  # POST /comments
  def create
    @comment = @project.comments.new(comment_params)

    if @comment.save
      redirect_to @project, notice: "Comment was successfully created."
    else
      redirect_to @project, alert: "Something went wrong while creating a comment."
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to project_url(@project), notice: "Comment was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body, :project_id, :parent_id)
  end
end
