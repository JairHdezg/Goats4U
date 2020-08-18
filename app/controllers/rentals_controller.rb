class RentalsController < ApplicationController

    def create
        @user = current_user
        @goat = Goat.find(params[:goat_id])

        @rental = Rental.new

        @rental.user = @user
        @rental.goat = @goat

        if @rental.save
            redirect_to goats_path
        else
            render goat_path(@goat)
        end
    end
end
