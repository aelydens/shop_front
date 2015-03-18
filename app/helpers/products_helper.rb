module ProductsHelper
  def print_price(price)
    format("$%.2f", price)
  end

  def print_quantity(quantity)
    if quantity == 0
      content_tag(:span, "Out of Stock")
    else
      content_tag(:span, "In Stock (#{quantity})")
    end
  end

end
