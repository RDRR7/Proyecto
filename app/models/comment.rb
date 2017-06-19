class Comment < ApplicationRecord
	belongs_to :campaign

	validates :author, presence: true
	validates :message, presence: true
end