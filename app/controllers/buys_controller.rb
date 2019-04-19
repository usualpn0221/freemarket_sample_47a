class BuysController < ApplicationController
  before_action :move_to_session,unless: :user_signed_in?
  before_action :have_card?
  def new
    buyitem
    @trade=@item.trade
    Payjp.api_key = PAYJP_SECRET_KEY
    @credit_info = Card.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(@credit_info.customer_id)
    @card=customer.cards.data[0]
    @brand=@card[:brand]
    @last4=@card[:last4]
    @exp_month=@card[:exp_month]
    @exp_year=@card[:exp_year]

  end

  def create

  end

  def index

  end


  def update

  end

  def pay
    buyitem
    Payjp.api_key = PAYJP_SECRET_KEY
    customer_id =current_user.cards[0].customer_id
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

  private

  def itembuy_params
    params.permit(:item_id)
  end

  def buyitem
    @item=Item.find(itembuy_params[:item_id])
  end

  def move_to_session
    redirect_to new_user_session_path
  end

  def have_card?
    @credit_info = Card.where(user_id: current_user.id)
    redirect_to new_card_path unless @credit_info.exists?
  end

end
