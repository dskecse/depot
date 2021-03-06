class Product < ActiveRecord::Base
  attr_accessible :title, :description, :image_url, :price

  has_many :line_items
  has_many :orders, through: :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :title, uniqueness: true, length: {
    minimum: 10,
    message: 'must be at least 10 characters long'
  }
  validates :image_url, allow_blank: true, format: {
    with:    %r(\A\w{1,}\.(gif|jpg|png)\z)i,
    message: 'must be a URL for GIF, JPG or PNG image'
  }

  private

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'line items exist')
      return false
    end
  end
end
