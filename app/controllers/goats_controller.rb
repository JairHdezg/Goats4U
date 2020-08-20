class GoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def new
    @users = User.all
    @goat = Goat.new
  end

  def index
    if params[:query]
      @query = params[:query]
      sql_query = " \
        name ILIKE :query \
        OR job ILIKE :query \
        OR breed ILIKE :query \
      "
      @goats = Goat.select("goats.*").where(sql_query, query: "%#{params[:query]}%")
    else
      @goats = Goat.all
    end

    @geocodedGoats = Goat.geocoded

    @markers = @geocodedGoats.map do |goat|
      {
        lat: goat.latitude,
        lng: goat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { goat: goat })
      }
    end
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
    @rental = Rental.new
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
    params.require(:goat).permit(:name, :age, :breed, :job, :address, :price_per_day, :description, :photo)
  end

end
