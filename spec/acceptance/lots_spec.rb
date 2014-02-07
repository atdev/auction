require 'acceptance/acceptance_helper'

feature "User makes bets", %q{
    ...
  } do

  context "User" do
    background do
      FactoryGirl.create(:admin)
      category = FactoryGirl.create(:category)
      5.times do
        product = FactoryGirl.create(:product, category_id: category.id)
        FactoryGirl.create(:lot, product_id: product.id)
      end
      start_admin_session 'admin@test.com', '12345678'
    end

    describe "js", js: true do
      scenario "User tries to make bets" do
        pending "should "
        #visit lots_path
        #current_path.should == lots_path
        #page.should have_content 'Latest Auctions'
        #lot = Lot.last
        #time = lot.time_end
        #id = 'lot_'+lot.id.to_s
        #
        #page.find('#'+id).first('.btn-success').click
        #time += lot.time_step.seconds
        #lot.time_end should eql time
      end
    end

    #scenario "Admin tries to see the lot" do
    #  lot = Lot.first
    #  visit admin_lot_path(lot)
    #  page.should have_content lot.name
    #end
    #
    #scenario "Admin tries to create the lot saccessfully" do
    #  visit new_admin_lot_path
    #  product = Product.first
    #  select product.name, from: 'Product'
    #  fill_in 'Min bet', with: 22
    #  fill_in 'Time step', with: 60
    #  click_on 'Create the lot'
    #  page.should have_content 'Lot created'
    #  page.should have_content 'min bet = 22'
    #end
    #
    #scenario "Admin tries to create the lot with invalid params" do
    #  visit new_admin_lot_path
    #  product = Product.first
    #  select product.name, from: 'Product'
    #  fill_in 'Min bet', with: 0
    #  fill_in 'Time step', with: 0
    #  click_on 'Create the lot'
    #  page.should have_css '#error_explanation'
    #end
    #
    #scenario "Admin tries to edit the lot saccessfully" do
    #  lot = Lot.first
    #  visit edit_admin_lot_path(lot)
    #  fill_in 'Min bet', with: lot.min_bet+1
    #  click_on 'Edit the lot'
    #  page.should have_content 'Lot updated'
    #end
    #
    #scenario "Admin tries to delete the lot" do
    #  visit admin_lots_path
    #  expect { page.first(".delete_link").click }.to change(Lot, :count).by(-1)
    #end
  end
end