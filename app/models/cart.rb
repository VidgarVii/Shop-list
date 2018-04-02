class Cart < ApplicationRecord
    has_many :items, dependent: :destroy 
    validates :name, presence: true
    #attr_accessor :name
    belongs_to :user
end
