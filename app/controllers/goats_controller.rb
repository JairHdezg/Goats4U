class GoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
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

  def edit
    @goat = Goat.find(params[:id])
  end

  def update
    @goat = Goat.find(params[:id])
    @goat.update(goat_params)

    redirect_to goat_path(@goat)
  end

  def destroy
    @goat = Goat.find(params[:id])
    @goat.destroy

    redirect_to goats_path
  end

  private

  def goat_params
    params.require(:goat).permit(:name, :age, :breed, :job, :city, :price_par_day, :description, :photo)
  end

end
