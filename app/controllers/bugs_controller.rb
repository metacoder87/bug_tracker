class BugsController < ApplicationController
  #before_action :require_user!, only: %i(new create edit update)
  #before_action :set_bug, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /bugs or /bugs.json
  def index
    @bugs = Bug.all
    render :index
  end

  # GET /bugs/1 or /bugs/1.json
  def show
    @bug = Bug.find(params[:id])
    render :show
  end

  # GET /bugs/new
  def new
    @bug = Bug.new
    render :new
  end

  # GET /bugs/1/edit
  def edit
    @bug = Bug.find(params[:id])
    render :edit
  end

  # app/controllers/bugs_controller.rb
def create
  @bug = current_user.bugs.new(bug_params)
  @bug.finder = current_user.email

  respond_to do |format|
    if @bug.save
      format.html { redirect_to bug_path(@bug), notice: "Bug was successfully created." }
      format.json { render :show, status: :created, location: @bug }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @bug.errors, status: :unprocessable_entity }
    end
  end
end


  # PATCH/PUT /bugs/1 or /bugs/1.json
  def update
    @bug = Bug.find(params[:id])

    @bug.fixer = current_user.email
    
    # Store the current fixer before the update
    previous_fixer = @bug.fixer

    respond_to do |format|
      if @bug.update(bug_params)
        set_fixer_if_in_progress(previous_fixer)
        format.html { redirect_to bug_url(@bug), notice: "Bug was successfully updated." }
        format.json { render :show, status: :ok, location: @bug }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bugs/1 or /bugs/1.json
  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy

    respond_to do |format|
      format.html { redirect_to bugs_url, notice: "Bug was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bug
      @bug = Bug.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bug_params
      params.require(:bug).permit(:project, :path, :priority, :description, :finder, :status, :fixer)
    end


    def set_fixer_if_in_progress(previous_fixer)
      # Check if the status has changed to 'in_progress' and update the fixer
      if @bug.status == 'in_progress' && @bug.fixer != previous_fixer
        @bug.update(fixer: current_user.email)
      end
    end

end
