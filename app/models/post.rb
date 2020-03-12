class Post < ApplicationRecord
	belongs_to :user, optional: true

	has_many :comments, dependent: :destroy
	
	scope :hasUser, -> {where.not(user_id: nil)}

	validates :title, presence: true, allow_blank: false
	validates :text, presence: true, allow_blank: false
	validates :image, presence: true, allow_blank: false

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", large: "500x500" }
  	
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
