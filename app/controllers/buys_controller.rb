class BuysController < ApplicationController
  before_action :move_to_session,unless: :user_signed_in?
  before_action :have_card?
  def new
    buyitem
    @trade=@item.trade
    Payjp.api_key = PAYJP_SECRET_KEY
    customer = Payjp::Customer.retrieve(current_user.cards[0].customer_id)
    @card = customer.cards.data[0]
    @brand = @card[:brand]
    @last4 = @card[:last4]
    @exp_month = @card[:exp_month]
    @exp_year = @card[:exp_year]

  end

  def create
    buyitem
    Payjp.api_key = PAYJP_SECRET_KEY
    customer_id = current_user.cards[0].customer_id
    Payjp::Charge.create(currency: 'jpy', amount: @item.price, customer: customer_id)

    if @item.trade_status == 3
       redirect_to items_path
    else
      @item.trade_status = 3
      @item.save
      @item.trade.buyer_id =current_user.id
      @item.trade.save
      redirect_to items_path
    end
  end

  def index

  end


  def update

  end


  private

  def buyitem
    @item=Item.find(params[:format])
  end

  def move_to_session
    redirect_to new_user_session_path
  end

  def have_card?
    @credit_info = Card.where(user_id: current_user.id)
    redirect_to new_card_path unless @credit_info.exists?
  end

end
