class MessagesController < ApplicationController

  before_action :set_shop

  def index
    @message = Message.new
    @messages = @shop.messages.includes(:user)
  end

  def create
    @message = @shop.messages.new(message_params)
    if @message.save
      redirect_to shop_path(@shop)
    else
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
end
