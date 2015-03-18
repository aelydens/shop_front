require "rails_helper"

describe OrderItem do
  describe "associations" do
    it "responds to product" do
      expect(OrderItem.new).to respond_to(:product)
    end

    it "responds to order" do
      expect(OrderItem.new).to respond_to(:order)
    end
  end
end
