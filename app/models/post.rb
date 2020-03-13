class Post < ApplicationRecord
	belongs_to :user
	# mount_uploader :image, ImageUploader
	has_many :comments, dependent: :destroy
  	# has_one_attached :image#, service :s3
	# validates :image, presence: true, allow_blank: false
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", large: "500x500" }
  	validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
