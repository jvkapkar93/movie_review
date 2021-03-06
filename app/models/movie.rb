class Movie < ApplicationRecord
	searchkick
	validates :title, presence: true
	belongs_to :user
	has_many :reviews
	has_attached_file :image, styles: { medium: "400x360"}
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
