require 'rails_helper'

RSpec.feature "Adding Product to Cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    @product = @category.products.create! name: Faker::Hipster.sentence(3), description: Faker::Hipster.paragraph(4), image: open_asset('apparel1.jpg'), quantity: 2, price: 2000
  end

  scenario "They click on add product to cart" do
    # ACT
    visit root_path
    page.click_on 'Add'

    # DEBUG 
    save_screenshot

    # Verify
    expect(page).to have_text 'My Cart (1)', count: 1
  end

end