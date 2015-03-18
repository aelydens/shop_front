require 'rails_helper'

feature 'Products CRUD' do
  scenario 'should be able to create a product' do
    Category.create!(title: "Dairy")
    sign_in
    visit root_path
    click_on "New Product"

    expect(current_path).to eq(new_product_path)
    fill_in :product_name, with: "Tasty Cheez"
    fill_in :product_price, with: 2.40
    select("Dairy", from: "Category")
    click_on "Create Product"

    expect(current_path).to eq(products_path)
    expect(page).to have_content("Tasty Cheez")
    expect(page).to have_content("Product Count: 1")

    click_on "New Product"
    fill_in :product_name, with: "Chocolate Milk"
    fill_in :product_price, with: 1.50
    select("Dairy", from: "Category")
    click_on "Create Product"

    expect(current_path).to eq(products_path)
    expect(page).to have_content("Chocolate Milk")
    expect(page).to have_content("Product Count: 2")
  end

  scenario 'should be able to edit a product' do
    sign_in
    cat = Category.create!(title: "Dairy")
    Category.create!(title: "Dry Goods")
    create_product(name: "Choco Pops", price: 2.50, category: cat)

    visit root_path
    click_on "Choco Pops"
    click_on "Edit"

    fill_in :product_name, with: "Froot Loops"
    fill_in :product_price, with: 3.00
    select("Dry Goods", from: "Category")

    click_on "Update Product"

    expect(page).to have_content("Froot Loops")
    expect(page).to have_content("Dry Goods")
    expect(page).not_to have_content("Choco Pops")
  end
end
