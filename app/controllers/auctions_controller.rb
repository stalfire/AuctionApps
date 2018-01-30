class AuctionsController < ApplicationController
	def new
		@auction = Auction.new
	end

	def create
		@auction = Auction.new(params_for_auction)
		if @auction.save
			redirect_to @auction
		else
			render 'new'
		end
	end

	def edit
		@auction = Auction.find(params[:id])
	end

	def update
		@auction = Auction.find(params[:id])
		if @auction.update(params_for_auction)
			redirect_to @auction
		else
			render 'edit'
		end
	end
	def bid
		@auction = Auction.find(params[:auction][:auction_id])
		@bidder = User.find(@auction.bidder)
		if @auction.update(params_for_bidder)
			respond_to do |format|
			format.json { render :json => {:auction => @auction, :bidder => @bidder}}
			end
		end
	end

	def destroy
		@auction = Auction.find(params[:id])
		@auction.destroy
		redirect_to root_path
	end

	def show
		@auction = Auction.find(params[:id])
		@bidder = User.find(@auction.bidder)
	end

	def index
		@auctions = Auction.all
		filtering_params(params).each do |key, value|
    	@auctions = @auctions.public_send(key, value) if value.present?
  		end
  		@auctions.order(:id)
	end

private
	
	def params_for_auction
		params.require(:auction).permit({avatar: []},:title,:category,:user_id)
	end
	def params_for_bidder
		params.require(:auction).permit(:bidder, :amount)
	end
	def filtering_params(params)
  		params.slice(:category,:user_id)
	end
end
