class ItemsController < ApplicationController
  def index
    policy_scope(Item)

  end

  def create
    @order = current_order
    @item = @order.items.new(item_params)
    @order.user = current_user
    @order.save!
    session[:order_id] = @order.id
    authorize @order
    authorize @item
    # This redirect to the checkout page not to the tshirt page
    redirect_to tshirt_path(item_params[:tshirt_id])
  end

  def destroy
    @order = current_order
    @item = @order.items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to order_path
    authorize @order
    authorize @item
  end

  private

  def item_params
    params.require(:item).permit(:quantity, :tshirt_id)
  end
end
