require 'rails_helper'

describe Order do
  describe 'associations' do
    describe '#user' do
      it 'returns the associated user' do
        user = create_user
        order = Order.create!(user_id: user.id)

        expect(order.user).to eq([user])
      end
    end

    describe '#order_items' do
      it 'returns associated order_items' do
        user = create_user
        product = create_product
        order = Order.create!(user_id: user.id)
        order_item = OrderItem.create(product_id: product.id, order_id: order.id, quantity: 12)

        expect(order.order_items).to eq([order_item])
      end
    end
  end
end
