require 'rails_helper'

describe ShopsController, type: :controller do

  let(:user) { create(:user) }
  let(:shop) { create(:shop)}
  let(:noodle_image) {attributes_for(:noodle_image)}


  describe 'GET #new' do
    it "renders the :new template" do
      login_admin user
      # controller_macros.rb内のlogin_userメソッドを呼び出し
      get :new
      expect(response).to render_template :new
    end
  end


  describe 'GET #edit' do
    let!(:shop) { create(:shop)}
    it "assigns the requested shop to @shop" do
      shops = @shop
      get :edit, params: { id: shop }
      expect(assigns(:shop)).to eq shop
    end

    it "renders the :edit template" do
      get :edit, params: { id: shop }
      expect(response).to render_template :edit
    end
  end
end