class Image < ApplicationRecord

  belongs_to :property

  before_save :check_featured

  validates :url, presence: true, url: true

  private

  def check_featured
    if self.is_featured_changed? && self.is_featured?
      self.property.images.where.not(id: self.id).update_all(is_featured: false)
    end
  end
end
