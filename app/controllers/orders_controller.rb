class OrdersController < ApplicationController
  skip_before_action :authenticate_user!
  def create
    tshirt = Tshirt.find(params[:tshirt_id])
    order = Order.create!(tshirt_sku: tshirt.sku, amount: tshirt.price, state: 'pending', user: current_user)
    authorize order
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
    authorize @order
  end
end