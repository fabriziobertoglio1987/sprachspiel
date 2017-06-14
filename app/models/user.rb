class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :rooms, :dependent => :destroy
  has_many :messages, :dependent => :destroy
  has_many :chatrooms, through: :messages 
  has_many :purchases, :dependent => :destroy
  has_many :sales, :dependent => :destroy

  def name 
  	email.split('@')[0]
  end

  def ending_balance
    starting_balance = [100, 100, 100, 100, 100]
    ending_balance = []

    # Subtract current_balance to starting_balance = ending_balance
    self.current_balance.each do |partial|
    #User.find(3).current_balance.each do |partial|
      i = 0
      ending_balance << ( starting_balance[i] + partial )
      i += 1
    end
    return ending_balance
  end
 
  def current_balance
    
    # Query all invoices from purchases/sales for that user in a nested array
    purchases = Purchase.where(user_id: self.id).joins(invoice: :price)
    sales = Sale.where(user_id: self.id).joins(invoice: :price)
    #purchases = Purchase.where(user_id: 3).joins(invoice: :price)
    #sales = Sale.where(user_id: 3).joins(invoice: :price)
    partials = []    
    resources = ["gold", "wood", "food", "stone", "metal"]
    resources.each do |resource| 
      partials << [purchases.sum(resource), sales.sum(resource)]
    end

    # Calculation of Balance
    # partials = [[purchase_gold, sales_gold],[wood],[stone]] 
    totals = []
    partials.each do |partial|
      totals << ( partial[1] - partial[0] )
    end

    return totals
  end

  def user_has_room(building)
    #binding.pry
    if self.admin 
      return false
    elsif building.id == 4 
      return true
    else
      #binding.pry
      return self.present? && self.rooms.present? 
    end
  end

  def room_owner(room)
    self == room.user
  end

  def admin?
    self.admin == true
  end
end
