class Donation < ApplicationRecord
	belongs_to :campaign

	validates :author, presence: true
	validates :message, presence: true
	validates :amount, numericality: { greater_than: 0 }
end