class Item < ApplicationRecord
has_many :orders, dependent: :destroy
has_one_attached :image
has_many :favorites, dependent: :destroy

validates :is_active, inclusion: [true, false]

  with_options presence: true do
    validates :name, presence: true
    validates :introduction, presence: true
    validates :item_image, presence: true
    validates :price, presence: true
end

has_one_attached :item_image

  def get_item_image(size)
    unless item_image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      item_image.attach(io: File.open(file_path),filename: "default-image.jpg",content_type: "image/jpeg")
    end
    item_image.variant(resize: size).processed
  end

end
