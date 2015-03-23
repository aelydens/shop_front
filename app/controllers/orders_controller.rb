class OrdersController < ApplicationController
  def show
  end

  def new
    @order_id = OrderId.new
  end
end
