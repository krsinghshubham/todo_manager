class TodosController < ApplicationController
    def index   #now we are defining what index does... so it reders a plain text as following. 
        render plain: Todo.order(:due_date).map {|object| object.to_pleasant_string}.join("\n")
    end
end
