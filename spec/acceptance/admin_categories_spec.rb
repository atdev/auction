require 'spec_helper'

feature "Admin manage categories", %q{
    In order to manage categories
    As an admin
    I want to get list of categories
    ....
  } do

  context "Admin" do
    background do
      FactoryGirl.create(:admin)
      5.times { FactoryGirl.create(:category) }
      start_admin_session 'admin@test.com', '12345678'
    end

    scenario "Admin tries to get list of categories" do
      visit admin_categories_path
      current_path.should == admin_categories_path
      page.should have_content 'Categories'
      Category.first(5).each do |c|
        page.should have_content(c.name)
      end
    end

    scenario "Admin tries to see the category" do # to see sub category needed
      category = Category.first
      visit admin_category_path(category)
      page.should have_content category.name
    end

    scenario "Admin tries to create the root category saccessfully" do # to create sub category needed
      visit new_admin_category_path
      fill_in 'category_name', with: 'category_test_1'
      attach_file 'category_picture_attributes_image', 'spec/support/files/test_image.jpg'
      click_on 'Create the category'
      page.should have_content 'Category was successfully created'
      page.should have_content 'category_test_1'
      image_src = Category.last().picture.image.to_s
      find('img')['src'].include?(image_src).should be_true
    end

    scenario "Admin tries to create the category with invalid params" do
      visit new_admin_category_path
      click_on 'Create the category'
      page.should have_css '#error_explanation'
    end

    scenario "Admin tries to edit the category saccessfully" do
      category = Category.first
      visit edit_admin_category_path(category)
      fill_in 'category_name', with: 'category_test_1'
      click_on 'Edit the category'
      page.should have_content 'Category was successfully updated'
    end

    scenario "Admin tries to delete the category" do
      visit admin_categories_path
      expect { page.first(".delete_link").click }.to change(Category, :count).by(-1)
    end
  end
end
