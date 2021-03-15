class TodosController < ApplicationController
    def index
        render plain: "Hello, this /todos!"
    end
end
