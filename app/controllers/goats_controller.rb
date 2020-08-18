class GoatsController < ApplicationController
  def new
    @users = User.all
    @goat = Goat.new
  end

  def index
    @goats = Goat.all
  end

  def create
    @goat = Goat.new(goat_params)
    @goat.user = current_user
    if @goat.save
      redirect_to goat_path(@goat)
    else
      render :new
    end
  end

  def show
    @goat = Goat.find(params[:id])
  end

  private

  def goat_params
    params.require(:goat).permit(:name, :age, :breed, :job, :city, :price_par_day, :description)
  end

end
