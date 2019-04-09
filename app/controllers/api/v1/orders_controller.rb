class Api::V1::OrdersController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  def create
    tshirt = Tshirt.find(params[:tshirt_id])
    order = Order.new(tshirt_sku: tshirt.sku, amount: tshirt.price, state: 'pending', user: current_user)
    authorize order
    if order.save!
      render :show, status: :created
    else
      render_error
    end
  end

  def show
    @items = policy_scope(current_order.items)
    @order = current_user.orders.find(params[:id])
    authorize @order
    authorize @items
  end
end