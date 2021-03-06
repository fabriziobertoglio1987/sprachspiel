class Event < ApplicationRecord
  TYPES = [["Alliance", :alliances],["Trade", :new_event],["Building", :new_event]]
  CATEGORIES = {Alliance: :Waffen, Trade: [:Werkzeuge, :Lebensmittel]}
  BONUS = {Alliance: [[:Angriff, 20],[:Verteidigung, 10]], Trade: [[:Geld, 30],[:Energie, 20]], Fight: [], Building:[]}  
  ICONS = {edit: ['033-pencil', :get], destroy: ['038-delete', :delete], update: ['039-check', :put], show: ['045-chains', :get]}
  EVENTS_HEADERS = %w[Bonus Options]
  INVENTORIES_HEADERS = %w[Product N Bonus]   
  # IMAGES = { "Alliance" => "manuscript", "Fight" => "helmet", "Building" => "castle", "Trade" => "money-bag" }
  has_and_belongs_to_many :users
  has_many :items
  has_many :properties
  has_one :category
  # has_many :users, class_name: "User", primary_key: "id", foreign_key: "alliance_id"
  validates :name, :description, presence: true

  TYPES.each do |type, path|
    scope type.downcase, -> { where(type: type) }
  end

  def self.image
    IMAGES[self.to_s]
  end

  def bonus
    BONUS[type.to_sym]
  end

  def self.inherited(child)
    child.instance_eval do
      def model_name
        Event.model_name
      end
    end
    super
  end  

  def icon(user)
    users.include?(user) ? "042-line" : "041-add"
  end
end
