class Auction < ApplicationRecord
	belongs_to :user

	validates :title, presence: true

	mount_uploaders :avatar, AvatarUploader
	serialize :avatars, JSON

	scope :category, -> (category) { where category: category}

	scope :title, -> (title) { where("title ILIKE ?", "#{title}%")}
end
