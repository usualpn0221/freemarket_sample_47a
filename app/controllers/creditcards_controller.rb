class CreditcardsController < ApplicationController
  protect_from_forgery except:  [:create]
  skip_before_action :delete_user
  before_action :move_to_root,unless: :user_signed_in?
  def index
    Payjp.api_key = PAYJP_SECRET_KEY
    @credit_info = Card.where(user_id: current_user.id)
    if @credit_info.exists?
      customer = Payjp::Customer.retrieve(@credit_info[0].customer_id)
      @card=customer.cards.data[0]
      @brand=@card[:brand]
      @last4=@card[:last4]
      @exp_month=@card[:exp_month]
      @exp_year=@card[:exp_year]
    end
  end

  def edit
  end

  def new
    gon.key = PAYJP_PUBLIC_KEY
    @creditcard=Creditcard.new
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
    card.save
    redirect_to complete_path
  end

  def destroy
    @credit_info = Card.find_by(user_id: current_user.id)
    @credit_info.destroy
    redirect_to creditcards_path
  end


  private

  def move_to_root
    redirect_to root_path
  end
end
