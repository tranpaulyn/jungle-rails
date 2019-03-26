require 'rails_helper'

RSpec.feature "Visiting a product page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    @product = @category.products.create! name: Faker::Hipster.sentence(3), description: Faker::Hipster.paragraph(4), image: open_asset('apparel1.jpg'), quantity: 2, price: 2000
  end

  scenario "They click on a product" do
    # ACT
    visit root_path
    page.click_on 'Details'

    # DEBUG 
    save_screenshot

    # Verify
    expect(page).to have_css 'article.product', count: 1
    expect(page).to have_css '.page-header', count: 1
    expect(page).to have_css '.products-show', count: 1
    expect(page).to have_css '.product-detail', count: 1
    expect(page).to have_css '.new_review', count: 1
  end

end