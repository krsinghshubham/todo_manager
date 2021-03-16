class TodosController < ApplicationController
    def index   #now we are defining what index does... so it reders a plain text as following. 
        render plain: "Hello, this /todos! and the current time is \n #{DateTime.now.to_s(:short)}"
    end
end
