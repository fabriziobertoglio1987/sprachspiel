class Building < ApplicationRecord
	has_many :rooms, :dependent => :destroy
	has_many :products, :dependent => :destroy
	has_many :descriptions, :dependent => :destroy
	belongs_to :price
	belongs_to :role
	has_one :chatroom, :dependent => :destroy

	def room_items(purchase)
		self.products.each do |product|
	        Item.bonus_items(product, purchase)
      	end    
        room = Building.find(4).rooms.first
        
        sale = Sale.creating(purchase, room)
        purchase.update_attributes(sale_id: sale.id, room_id: purchase.user.rooms.first.id)
		sale.saving(purchase)
    end  
end
