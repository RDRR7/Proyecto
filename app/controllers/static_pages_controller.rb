class StaticPagesController < ApplicationController
  def home
  	@campaigns=Campaign.order(:likes).reverse_order
  end
end
