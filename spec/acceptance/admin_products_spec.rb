require 'acceptance/acceptance_helper'

feature "Admin manage products", %q{
    In order to add products to auctions
    As an admin
    I want to manage products
  } do

  context "Admin" do
    background do
      FactoryGirl.create(:admin)
      category = FactoryGirl.create(:category)
      5.times do
        FactoryGirl.create(:product, category_id: category.id)
      end
      start_admin_session 'admin@test.com', '12345678'
      @path = admin_products_path
    end

    it_behaves_like "Admin accessible"

    scenario "Admin tries to get list of products" do
      visit @path
      current_path.should == @path
      page.should have_content 'Products'
      Product.first(5).each do |product|
        page.should have_content(product.name)
      end
    end

    scenario "Admin tries to see the product" do
      product = Product.first
      visit admin_product_path(product)
      page.should have_content product.name
    end

    scenario "Admin tries to create the product saccessfully" do
      visit new_admin_product_path
      category = Category.first
      select category.name, from: 'Category'
      fill_in 'Name', with: 'product_test_1'
      fill_in 'Shop price', with: 60
      fill_in 'Description', with: 'description for product_test_1'
      click_on 'Create the product'
      page.should have_content 'Product created'
      page.should have_selector('.product_title', text: 'product_test_1')
    end

    scenario "Admin tries to create the product with invalid params" do
      visit new_admin_product_path
      click_on 'Create the product'
      page.should have_css '#error_explanation'
    end

    scenario "Admin tries to edit the product saccessfully" do
      product = Product.first
      visit edit_admin_product_path(product)
      fill_in 'Name', with: 'product_test_333'
      click_on 'Edit the product'
      page.should have_content 'Product updated'
      page.should have_selector('.product_title', text: 'product_test_333')
    end

    scenario "Admin tries to delete the product" do
      visit @path
      expect { page.first(".delete_link").click }.to change(Product, :count).by(-1)
    end
  end
end