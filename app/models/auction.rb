class Auction < ApplicationRecord
	belongs_to :user

	validates :title, presence: true

	mount_uploaders :avatar, AvatarUploader
	serialize :avatars, JSON

	scope :category, -> (category) { where category: category}
	scope :user_id, -> (user_id) { where user_id: user_id}

	scope :title, -> (title) { where("title ILIKE ?", "#{title}%")}
end
