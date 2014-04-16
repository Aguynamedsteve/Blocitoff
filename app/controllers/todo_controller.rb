class TodoController < ApplicationController

  def index
    @todo = Todo.new
    @todos = Todo.where(done: false)
    @todone = Todo.where(done: true)
  end

  def new
   @todo = Todo.new   
  end  

  def show
    @todo = Todo.find(params[:id])    
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to todo_index_path, :notice => "Item was saved."
    else
      render "new"
    end
  end

  def update
    @todo = Todo.find(params[:id])
    
    if @todo.update_attribute(:done, true)
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

