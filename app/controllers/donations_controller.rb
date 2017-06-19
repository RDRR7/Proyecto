class DonationsController < ApplicationController
	def new
		@campaign=Campaign.find(params[:campaign_id])
		@donation=@campaign.donations.build
	end

	def create
		@campaign=Campaign.find(params[:campaign_id])
		@donation=@campaign.donations.build(donation_params)

		if @donation.save
			redirect_to @campaign
		else
			render 'new'
		end
	end

	private
		def donation_params
			params.require(:donation).permit(:author, :message, :amount)
		end
end
