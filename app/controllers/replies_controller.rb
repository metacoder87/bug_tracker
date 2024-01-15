class RepliesController < ApplicationController
  before_action :set_reply, only: %i[ show edit update destroy ]

  # GET /replies or /replies.json
  def index
    @replies = Reply.all
  end

  # GET /replies/1 or /replies/1.json
  def show
  end

  # GET /replies/new
  def new
    @bug = Bug.find(params[:bug_id])
    @comment = @bug.comments.find(params[:comment_id])
    @reply = @comment.replies.build
  end

  # GET /replies/1/edit
  def edit
    set_reply
    @bug = @reply.bug
    @comment = @reply.comment
  end

  # POST /replies or /replies.json
  def create
    @bug = Bug.find(params[:bug_id])
    @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.new(reply_params)
    @reply.user_id = current_user.id
    @reply.bug_id = @bug.id

    respond_to do |format|
      if @reply.save
        format.html { redirect_to @bug, notice: "Reply was successfully created." }
        format.json { render :show, status: :created, location: @reply }
      else

        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /replies/1 or /replies/1.json
  def update
    respond_to do |format|
      if @reply.update(reply_params)
        format.html { redirect_to bugs_path, notice: "Reply was successfully updated." }
        format.json { render :show, status: :ok, location: @reply }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1 or /replies/1.json
  def destroy
    @bug = Bug.find(params[:bug_id])
    @reply.destroy

    respond_to do |format|
      format.html { redirect_to bug_path(@bug), notice: "Reply was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reply_params
      params.require(:reply).permit(:body, :user_id, :bug_id, :comment_id)
    end
end
