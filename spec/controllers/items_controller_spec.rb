require 'rails_helper'

# describe ItemsController, type: :controller do
describe ItemsController do

  # describe 'GET #show' do
  #   item = create(:item)

  #   it "インスタンス変数は期待した値になるか？" do
  #     user = create(:user)
  #     get :show, params: {  id: 1 }
  #     expect(assigns(:item, :user)).to match(:item, :user)
  #   end

  #   it "期待するビューに遷移するか？" do
  #     get :show, params: {  id: item.id }
  #     expect(response).to render_template :show , params: {  id: item.id }
  #   end
  # end


  describe 'GET #index' do
    it "populates an array of items ordered by created_at DESC" do
      items = create_list(:item, 3)
      get :index
      expect(assigns(:items)).to match(items.sort{|a, b| b.created_at <=> a.created_at })
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

end
