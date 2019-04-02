require 'rails_helper'

describe ItemsController do
  describe 'GET #show' do


  #   it "インスタンス変数は期待した値になるか？" do
  #     "擬似的にリクエストを行ったことにするコードを書く"
  #     "エクスペクテーションを書く"
    # end

    it "期待するビューに遷移するか？" do
      get :show, params: {  id: 2 }
      expect(response).to render_template :show , params: {  id: 2 }
    end
  end
end
