class Room < ApplicationRecord
  has_many :reservations
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :address, presence: true


  after_initialize :set_default_image, if: :new_record?

  def set_default_image
    self.image.url ||= "https://rails-02-sample.herokuapp.com/assets/room/default-image-4e0ac6b8d01335b5b22fe6586af13644ae51dddb6aeabf35b9174e80f13cd09d.png"
  end
end
