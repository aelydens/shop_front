def create_user(options={})
  defaults = {username: "luv2shop", password: "password"}

  User.create!(defaults.merge(options))
end

def create_product(options={})
  defaults = {name: "Tasty Cheez", price: 2.40}

  Product.create!(defaults.merge(options))
end
