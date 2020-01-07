class HomeController < ApplicationController
  # before_action :authenticate_user!, only: :index

  def index
    @shops = Shop.where(params[:shop_id])
  end

end
