class TodosController < ApplicationController   #project controller class, mostly inspired from projectName. 
    def index   
        # render plain: Todo.order(:due_date).map {|object| object.to_pleasant_string}.join("\n") #order the output by due_date
        # we want index to render index.html.erb sitting in views folder and not directly from the data base using Todo object. 
        #for this we have to create a file as "index.html" in views folder insider a user created sub folder todos (because we are going with TodosController)
        render "index"
    end

    def show
        id= params[:id] # beacuase parameters cannot be passed from routes.
        todo= Todo.find(id)
        render plain: todo.to_pleasant_string
    end

    def new
    end

    def edit
    end

    def create
        todo_text = params[:todo_text]
        
    end

    def update
    end

    def destroy
    end

end


# Params = As you might have guessed, params is an alias for the parameters method. params comes from ActionController::Base, which is accessed by your application via ApplicationController. Specifically, params refers to the parameters being passed to the controller via a GET or POST request.
# In a GET request, params get passed to the controller from the URL in the user’s browser. For example, if our app’s controller looked like 
#  def show 
#    @person = Person.find(params[:name]) 
#     endand the user typed in: http://example.com/person/avi then the controller would pass in {:name => “avi”} to the show method, which would set the @person instance variable to the person in the database with the name “avi”.

