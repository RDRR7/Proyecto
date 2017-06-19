class CommentsController < ApplicationController
	def new
		@campaign=Campaign.find(params[:campaign_id])
		@comment=@campaign.comments.build
	end

	def create
		@campaign=Campaign.find(params[:campaign_id])
		@comment=@campaign.comments.build(comment_params)

		if @comment.save
			redirect_to @campaign
		else
			render 'new'
		end
	end

	def destroy
		@campaign=Campaign.find(params[:campaign_id])
		@comment=Comment.find(params[:id])
		@comment.destroy
		redirect_to @campaign
	end

	private
		def comment_params
			params.require(:comment).permit(:author, :message)
		end
end
