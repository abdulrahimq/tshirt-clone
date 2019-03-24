class ItemsController < ApplicationController
def create
  @rental = current_rental
  @item = @rental.items.new(item_params)
  @rental.user = current_user
  @rental.save!
  session[:rental_id] = @rental.id
  authorize @rental
  authorize @item
  # This redirect to the checkout page not to the tshirt page
  redirect_to tshirt_path(item_params[:tshirt_id])
end

def destroy
  @rental = current_rental
  @item = @rental.items.find(params[:id])
  @item.destroy
  @rental.save
  redirect_to rental_path
  authorize @rental
  authorize @item
end

private

def item_params
  params.require(:item).permit(:quantity, :tshirt_id)
end
end
