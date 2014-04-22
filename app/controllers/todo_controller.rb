class TodoController < ApplicationController

  def index
    @todo = Todo.new
    @todos = current_user.todos.where(done: false)
  end

  def new
   @todo = Todo.new   
  end  

  def show
    @todo = Todo.find(params[:id])    
  end

  def create
    @todo = current_user.todos.build(todo_params)

    if @todo.save
      flash[:notice] = "Item was saved."
      redirect_to todo_index_path, flash[:notice] => "Item was saved."
    else
      render "new"
    end
  end

  def update
    @todo = Todo.find(params[:id])
    
    if @todo.update_attribute(:done, true)
      flash[:notice] = "Item."
      redirect_to todo_index_path, :notice => "Item marked as done."
    else
      redirect_to todo_index_path, :error => "Unable to mark item as done."
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    redirect_to todo_index_path :notice => "Item deleted."
  end

private

  def todo_params
    params.require(:todo).permit(:name, :done)
  end
end

