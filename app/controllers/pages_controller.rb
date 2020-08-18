class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def landing_page
    @disable_nav = true
  end
end
