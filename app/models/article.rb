class Article < ApplicationRecord

  validates :title, presence: true, length: { minimum:10, maximum:200 }
  validates :description, presence: true, length: { minimum: 50}
  has_one_attached :image, dependent: :destroy

end
