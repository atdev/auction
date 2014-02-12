require 'acceptance/acceptance_helper'

feature "Admin manage lots", %q{
    In order to sell products from auctions
    As an admin
    I want to manage lots
  } do

  context "Admin" do
    background do
      FactoryGirl.create(:admin)
      category = FactoryGirl.create(:category)
      5.times do
        product = FactoryGirl.create(:product, category_id: category.id)
        FactoryGirl.create(:lot, product_id: product.id)
      end
      start_admin_session 'admin@test.com', '12345678'
      @path = admin_lots_path
    end

    it_behaves_like "Admin accessible"

    scenario "Admin tries to get list of lots" do
      visit @path
      current_path.should == @path
      page.should have_content 'Lots'
      Lot.first(5).each do |lot|
        page.should have_content(lot.name)
      end
    end

    scenario "Admin tries to see the lot" do
      lot = Lot.first
      visit admin_lot_path(lot)
      page.should have_content lot.name
    end

    scenario "Admin tries to create the lot saccessfully" do
      visit new_admin_lot_path
      product = Product.first
      select product.name, from: 'Product'
      fill_in 'Start price', with: 22
      fill_in 'Time step', with: 60
      fill_in 'Bet step', with: 60
      click_on 'Create the lot'
      page.should have_selector('.success', text: 'Lot created')
      page.should have_content 'Start price = 22'
    end

    scenario "Admin tries to create the lot with invalid params" do
      visit new_admin_lot_path
      product = Product.first
      select product.name, from: 'Product'
      fill_in 'Start price', with: 0
      fill_in 'Time step', with: 0
      click_on 'Create the lot'
      page.should have_css '#error_explanation'
    end

    scenario "Admin tries to edit the lot saccessfully" do
      lot = Lot.first
      visit edit_admin_lot_path(lot)
      fill_in 'Start price', with: lot.start_price+1
      click_on 'Edit the lot'
      page.should have_content 'Lot updated'
    end

    scenario "Admin tries to delete the lot" do
      visit @path
      expect { page.first(".delete_link").click }.to change(Lot, :count).by(-1)
    end
  end
end