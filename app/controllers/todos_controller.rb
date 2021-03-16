class TodosController < ApplicationController
    def index   #now we are defining what index does... so it reders a plain text as following. 
        render plain: Todo.all.to_ary
    end
end
