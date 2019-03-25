require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'validates presence of name' do
      product = Product.new
      product.name = ''
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")

      product.name = 'Jelly Beans'
      product.valid?
      expect(product.errors[:name]).not_to include("can't be blank")
    end

    it 'validates presence of price' do
      product = Product.new
      product.price = ''
      product.valid?
      expect(product.errors[:price]).to include ("is not a number")

      product.price = 149.99
      product.valid?
      expect(product.errors[:price]).not_to include("is not a number")
    end 

    it 'validates presence of quantity' do 
      product = Product.new
      product.quantity = ''
      product.valid?
      expect(product.errors[:quantity]).to include ("can't be blank")

      product.quantity = 100
      product.valid?
      expect(product.errors[:quantity]).not_to include("can't be blank")
    end 

    it 'validates the presence of category' do
      product = Product.new
      product.category = nil
      product.valid?
      expect(product.errors[:category]).to include("can't be blank")

      shoes = Category.create name: 'Shoes'
      product.category = shoes
      product.valid?
      expect(product.errors[:category]).not_to include("can't be blank")
    end
  end
end
