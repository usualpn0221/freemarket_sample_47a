class CardsController < ApplicationController
  protect_from_forgery except:  [:create]
  def new
    gon.key = PAYJP_PUBLIC_KEY
    @creditcard = Creditcard.new
  end

  def create
    Payjp.api_key = PAYJP_SECRET_KEY
      customer = Payjp::Customer.create(
      card: params[:pay_id]
    )
    card = Card.new(
      pay_id: params[:pay_id],
      customer_id: customer.id,
      user_id: current_user.id)
    if card.save
      redirect_to root_path
    else
      render :new
    end
  end
end
