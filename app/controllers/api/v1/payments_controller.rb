class Api::V1::PaymentsController < Api::V1::BaseController
  before_action :set_order

  def new
    authorize @order
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email: params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @order.amount_cents,
      description: "Payment for tshirt #{@order.tshirt_sku} for order #{@order.id}",
      currency: @order.amount.currency
    )

    @order.update(payment: charge.to_json, state: 'paid')
    authorize @order
    redirect_to order_path(@order)
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    authorize @order
    redirect_to new_order_payment_path(@order)
  end

private

  def set_order
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
  end
end