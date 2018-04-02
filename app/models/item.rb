class Item < ApplicationRecord
    belongs_to :cart
    #attr_accessor :name, :price, :status
    validates :name, presence: true
    validates :name, length: { in: 1..50 }
    validates :description, length: { in: 0..250 }
    #validates :status, length: { in: 0..1 }
    validates :importance, length: { in: 0..10 }
end
