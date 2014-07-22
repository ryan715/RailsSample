class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :job_done ]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.where(:to => current_user.email) 
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @project = Project.find( @task.project_id)
  end

  # GET /tasks/new
  def new
    # current_project = @project
    @task = Task.new(task_params)
    
    @users = User.where("email not in (?)", current_user.email)
    
  end

  # GET /tasks/1/edit
  def edit
    @users = User.where("email not in (?)", current_user.email)
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task }
      else
        format.html { render action: 'new' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def job_done
    respond_to do |format|
    # @task = Product.find_by_id(params[:id])
      if @task.update_attribute(:done, true)
        format.html { redirect_to @task, notice: 'Task was successfully done.' }
        format.json { head :no_content}
      else
        format.html { render action: 'show' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
  
  def done
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
     # params[:task]
      params.require(:task).permit(:name, :description, :from, :to, :project_id, :done)
    end
    
    
end
