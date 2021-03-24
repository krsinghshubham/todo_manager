class TodosController < ApplicationController
    def index   #now we are defining what index does... so it reders a plain text as following. 
        render plain: Todo.order(:due_date).map {|object| object.to_pleasant_string}.join("\n")
    end

    def show
        id= params[:id]
        todo= Todo.find(id)
        render plain: todo.to_pleasant_string
    end
end


# Params = As you might have guessed, params is an alias for the parameters method. params comes from ActionController::Base, which is accessed by your application via ApplicationController. Specifically, params refers to the parameters being passed to the controller via a GET or POST request.
# In a GET request, params get passed to the controller from the URL in the user’s browser. For example, if our app’s controller looked like  def show @person = Person.find(params[:name]) endand the user typed in: http://example.com/person/avi then the controller would pass in {:name => “avi”} to the show method, which would set the @person instance variable to the person in the database with the name “avi”.
