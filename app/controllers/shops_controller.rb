class ShopsController < ApplicationController
  before_action :set_shop, only: [:edit, :update, :destroy]
  before_action :set_sidebar, only: [:show, :new, :create, :edit, :update]
  # before_action :set_noodle_image, only: [:edit, :update]

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = current_user.shops.new
    # @noodle_images = current_user.NoodleImage.new
  end

  def create
    @shop = current_user.shops.new(shop_params)
    if @shop.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to root_path
  end

  private
  def shop_params
    params.require(:shop).permit(:name, :address, :map, :horiday, :opening_hours, :menu, :rule, :detail)
  end

  # def noodle_image_params
  #   params.require(:noodle_images).require(:image)
  # end

  def set_shop
    @shop = current_user.shops.find(params[:id])
  end

  # def set_noodle_image
  #   @noodle_image = NoodleImage.find(params[:id])
  # end

  def set_sidebar
    @shops = Shop.where(params[:id])
  end
end
