class CampaignsController < ApplicationController
  def index
  	@campaigns=Campaign.order(:created_at)
  end

  def medical
    @campaigns=Campaign.where(category: 'Medical')
  end

  def education
    @campaigns=Campaign.where(category: 'Education')
  end

  def charity
    @campaigns=Campaign.where(category: 'Charity')
  end

  def community
    @campaigns=Campaign.where(category: 'Community')
  end

  def events
    @campaigns=Campaign.where(category: 'Events')
  end

  def dashboard
    @campaigns=Campaign.where(user_id: current_user.id)
  end

  def show
    @campaign=Campaign.find(params[:id])
    @comments=@campaign.comments.order(:created_at)
    @donations=@campaign.donations.order(:created_at)
  end

  def new
  	@user=User.find(params[:user_id])
    @campaign=@user.campaigns.build
  end

  def create
    @user=User.find(params[:user_id])
    @campaign=@user.campaigns.build(campaign_params)

   if @campaign.save
     redirect_to @campaign
   else
     render 'new'
   end
  end

  def edit
    @campaign=Campaign.find(params[:id])
  end

  def update
    @campaign=Campaign.find(params[:id])
    if @campaign.update(campaign_params)
      redirect_to @campaign
    else
      render 'edit'
    end
  end

  def destroy
    @campaign=Campaign.find(params[:id])
    @campaign.destroy
    redirect_to root_path
  end

  def plus_like
    campaign=Campaign.find(params[:format])
    campaign.likes = campaign.likes + 1
    campaign.save

    redirect_to campaign
  end

  private
  def campaign_params
  	params.require(:campaign).permit(:title, :review, :description, :goal, :category, :image_url, :end_date)
  end
end
