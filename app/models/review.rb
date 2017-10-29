class Review < ApplicationRecord
	searchkick
	belongs_to :user
	belongs_to :movie
end
