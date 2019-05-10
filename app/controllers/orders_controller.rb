class OrdersController < ApplicationController
  skip_before_action :authenticate_user!
  def create
    # tshirt = Tshirt.find(params[:tshirt_id])
    # item = Item.find(params[:item_id])
    order = Order.create!(amount: find_orders_items, state: 'pending')
    authorize order
    redirect_to new_order_payment_path(order)
  end

  def show
    @items = policy_scope(current_order.items)
    @order = current_user.orders.find(params[:id])
    authorize @order
    authorize @items
  end

  def shopping_cart
    @items = policy_scope(current_order.items)
    @order = current_order
    authorize @order
    authorize @items
  end

  private

  def find_orders_items
    orders_total_price = 0
    # Item.all.each do |item|
    #   if item[:order_id] == current_order.id
    #     orders_total_price += item.design.price * item.quantity
    #   end
    # end
    # puts orders_total_price
    # return orders_total_price
  end
end
