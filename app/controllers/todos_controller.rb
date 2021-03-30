class TodosController < ApplicationController
  def index
    # render plain: Todo.order(:due_date).map {|object| object.to_pleasant_string}.join("\n") #order the output by due_date
    # @todo = Todo.of_user(current_user)
    @todo = current_user.todos
    render "index"
  end

  def show
    id = params[:id] # beacuase parameters cannot be passed from routes.
    todo = Tcurrent_user.todos
    render plain: todo.to_pleasant_string
  end

  def create
    todo_text = params[:todo_text]
    # due_date = DateTime.parse(params[:due_date])
    due_date = params[:due_date]
    # new_todo = Todo.create!( #becuase we want to raise exceptions for blank todos alonge.
    new_todo = Todo.new(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
      user_id: current_user.id,
    )
    if new_todo.save
      redirect_to todos_path
    else
      flash[:error] = new_todo.errors.full_messages.join(", ") #full message is provided by rails activeMethods:RailsValidation we are using.
      redirect_to todos_path # on every new path, flash[:error] cache gets destroyed.
    end
  end

  def update
    id = params[:id]
    completed = params[:completed]
    selected_todo = current_user.todos
    selected_todo.completed = completed
    selected_todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    selected_todo = current_user.todos
    selected_todo.destroy #this is an active reocrd method to remove/destroy a record form a table
    redirect_to todos_path
  end
end

# Params = As you might have guessed, params is an alias for the parameters method. params comes from ActionController::Base, which is accessed by your application via ApplicationController. Specifically, params refers to the parameters being passed to the controller via a GET or POST request.
# In a GET request, params get passed to the controller from the URL in the user’s browser. For example, if our app’s controller looked like
#  def show
#    @person = Person.find(params[:name])
#     endand the user typed in: http://example.com/person/avi then the controller would pass in {:name => “avi”} to the show method, which would set the @person instance variable to the person in the database with the name “avi”.
