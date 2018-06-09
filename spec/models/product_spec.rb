require 'rails_helper'

RSpec.describe Product, type: :model do
	describe '#picture' do
    it 'returns the correct picture name' do
       product = FactoryBot.build(:hammer)
       expect(product.picture).to eql('hammer2.svg')
    end
   end
end
