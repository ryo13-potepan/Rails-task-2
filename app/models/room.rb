class Room < ApplicationRecord
  has_many :reservations
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}
  validates :address, presence: true


  
end
