class ShopsController < ApplicationController
  before_action :set_shop, only: [:edit, :update, :destroy]
  before_action :set_sidebar, only: [:show, :new, :create, :edit, :update]
  before_action :if_not_admin, only: [:new, :create, :edit, :update, :destroy]

  def show
    @shop = Shop.find(params[:id])
    @message = Message.new
    @messages = @shop.messages.includes(:user)
  end

  def new
    @shop = current_user.shops.new
    @shop.noodle_images.build
  end

  def create
    @shop = current_user.shops.new(shop_params)
    @shop.save!
    redirect_to root_path
  rescue
    render :new
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
    params.require(:shop).permit(:name, :address, :latitude, :longitude, :map, :horiday, :opening_hours, :menu, :rule, :detail, noodle_images_attributes: [:id,:image])
  end

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_shop
    @shop = current_user.shops.find(params[:id])
  end

  def set_sidebar
    @shops = Shop.where(params[:id])
  end

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
