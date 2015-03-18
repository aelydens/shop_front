module ProductsHelper
  def print_price(price)
    format("$%.2f", price)
  end

  def print_quantity(quantity)
    if quantity =< 0
      content_tag("Out of Stock")
    else
      content_tag("In Stock", quantity)
    end
  end

end
