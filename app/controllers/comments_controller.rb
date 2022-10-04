class CommentsController < ApplicationController

    def create
        @comment = current_user.comments.new(comment_params)
        respond_to do |format|
            if @comment.save
                format.html { redirect_to bug_path(@comment.bug), notice: "Your comment was posted" }
                format.json { render json: @comment, status: :created, location: @comment }
                format.js
            else
                format.html { render :new }
                format.json { render json: @comment.errors, status: :unprocessable_entity }
                format.js { render js: %Q{consol.log("Error:", "#{@comment.errors.full_messages.join(', ')}") } }
            end
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :bug_id)
    end

end
