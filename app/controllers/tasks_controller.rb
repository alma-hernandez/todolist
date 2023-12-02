class TasksController < ApplicationController
    def index
        @tasks = Task.all
        render 'tasks/index'
    end
    def create

        @task = Task.new(task_params)
        if @task.save
          render 'tasks/create' # can be omitted
        end
    end
      private
        def task_params
          params.require(:task).permit(:content)
        end

    def destroy
        @task = Task.find_by(id: params[:id])
        
        if @task and @task.destroy
            render json: { success: true }
        else
            render json: { success: false }
        end
     end
        private

    def mark_complete
        @task = Task.find_by(id: params[:id])
        if @task and @task.update(completed: true)
            render 'tasks/mark_complete'
        end
    end
          private
end
