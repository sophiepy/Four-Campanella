class Item < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  # has_one_attached :image
  has_many :favorites, dependent: :destroy
  has_one_attached :item_image

  validates :is_active, inclusion: [true, false]

    with_options presence: true do
      validates :name, presence: true
      validates :introduction, presence: true
      validates :item_image, presence: true
      validates :price, presence: true
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @items = Item.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @items = Item.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @items = Item.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @items = Item.where("name LIKE?","%#{word}%")
    else
      @items = Item.all
    end
  end

  def get_item_image(size)
    unless item_image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      item_image.attach(io: File.open(file_path),filename: "default-image.jpg",content_type: "image/jpeg")
    end
    item_image.variant(resize: size).processed
  end

end
