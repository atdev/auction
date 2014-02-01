require 'acceptance/acceptance_helper'

feature "Admin manage categories", %q{
    In order to be able to classify products
    As an admin
    I want to manage categories
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

    scenario "Admin tries to see the category" do
      category = Category.first
      visit admin_category_path(category)
      page.should have_content category.name
    end

    scenario "Admin tries to create the root category saccessfully" do
      visit new_admin_category_path
      fill_in 'category_name', with: 'category_test_1'
      attach_file 'Image', 'spec/support/files/test_image.jpg'
      click_on 'Create the category'
      page.should have_content 'Category created'
      page.should have_content 'category_test_1'
      image_src = Category.last().picture.image.thumb.to_s
      find('img')['src'].include?(image_src).should be_true
    end

    scenario "Admin tries to create the sub category for the root category" do
      visit admin_categories_path
      @root_category = find('.table').first('.category')
      @root_category.click
      click_on 'Add Subcategory'
      fill_in 'category_name', with: 'sub_category_test_1'
      attach_file 'Image', 'spec/support/files/test_image.jpg'
      click_on 'Create the category'
      page.should have_content 'Category created'
      page.should have_content @root_category.text
      page.should have_content 'sub_category_test_1'
      image_src = Category.last().picture.image.thumb.to_s
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
      page.should have_content 'Category updated'
    end

    describe "js", js: true do
      scenario "Admin tries to delete the category" do
        visit admin_categories_path
        page.first('.delete_link').click # CLICK_ON BUTTON NAME
        page.driver.browser.switch_to.alert.accept
        page.should have_content 'Category deleted'
      end

      scenario "Admin tries to go to the category's page by using jstree menu" do
        visit admin_categories_path
        first_category = Category.first
        within "#jstree_div" do
          click_on first_category.name
        end
        page.should have_selector('h4', text: first_category.name) # have_selector. title h4.title
      end
    end
  end
end
