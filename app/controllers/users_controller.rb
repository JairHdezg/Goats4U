class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end
end

# user GET    /users/:id(.:format)  users#show