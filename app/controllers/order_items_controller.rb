class OrderItemsController < ApplicationController
  before_action :find_order, only: [:create]

  def new
    @order_item = OrderItem.new
  end

  def create
    @order_item = OrderItem.new(product_id: params[:product_id], order_id: @order.id)
    @order_item.save
    redirect_to @order, notice: 'Successfully added product to cart.'
  end

  private

  def find_order
    begin
      @order = Order.find(session[:order_id])
    rescue ActiveRecord::RecordNotFound
      @order = Order.create(status: "unsubmitted")
      session[:order_id] = @order.id
    end
  end

end
