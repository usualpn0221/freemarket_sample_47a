require 'rails_helper'

describe ItemsController do

  describe 'GET #show' do

    # let(:user) { create(:user) }
    it "インスタンス変数は期待した値になるか？" do
      item = create(:item)
      get :show, params: {  id: item.id }
      expect(assigns(:item)).to match(item)
    end

    it "期待するビューに遷移するか？" do
      item = create(:item)
      get :show, params: {  id: item.id }
      expect(response).to render_template :show , params: {  id: item.id }
    end
  end


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
