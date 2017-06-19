class Campaign < ApplicationRecord
	belongs_to :user
	has_many :comments
	has_many :donations

	validates :title, presence: true
	validates :review, length: { maximum: 200 }, presence: true
	validates :goal, numericality: { greater_than: 0 }
	validates :end_date, presence: true
	validate :check_date

	before_save :default_values

	private
		def check_date
			if !end_date.nil?
				if (Date.today + 6.months) < end_date
					errors.add(:end_date, "needs to be less the 6 months from today.")
				end
			end
		end
		
		def default_values
			self.likes ||= 0
		end
end