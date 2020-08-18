class RentalsController < ApplicationController

    def create
        @user = current_user
        @goat = Goat.find(params[:goat_id])

        @rental = Rental.new(rental_params)

        @rental.user = @user
        @rental.goat = @goat

        if @rental.save
            redirect_to user_path(@user)
        else
            render goat_path(@goat)
        end
    end

    private
    def rental_params
        params.require(:rental).permit(:start_date, :end_date)
    end
end
