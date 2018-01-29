class Auction < ApplicationRecord
	belongs_to :user

	validates :title, presence: true

	mount_uploaders :avatar, AvatarUploader
	serialize :avatars, JSON
end
