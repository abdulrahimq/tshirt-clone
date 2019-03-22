class RentalsController < ApplicationController
  def show
    @items = policy_scope(current_rental.items)
    authorize @items
  end
end
