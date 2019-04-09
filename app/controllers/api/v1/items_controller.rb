class Api::V1::ItemsController < Api::V1::BaseController
    acts_as_token_authentication_handler_for User
    def create
        @order = current_order
        @item = @order.items.new(item_params)
        @order.user = current_user
        @order.save!
        session[:order_id] = @order.id
        authorize @order
        authorize @item
        if !@item.save!
          render_error
        end
    end

    def destroy
        @order = current_order
        @item = @order.items.find(params[:id])
        @item.destroy!
        authorize @order
        authorize @item
        if !@order.save!
            render_error
        end
    end

    private

    def item_params
      params.require(:item).permit(:quantity, :tshirt_id)
    end
end