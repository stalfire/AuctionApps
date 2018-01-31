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
		@amount = params[:auction][:amount]
		if @amount.to_i > @auction.amount.to_i
			if @auction.update(params_for_bidder)
				@bidder = User.find(@auction.bidder)
				respond_to do |format|
					format.json { render :json => {:auction => @auction, :bidder => @bidder, :message => "Bid Success"}}
				end
			end
		else
			respond_to do |format|
				if @auction.bidder != nil
					@bidder = User.find(@auction.bidder)
					format.json { render :json => {:auction => @auction, :bidder => @bidder, :message => "Someone Has Higher Bid"}}
				else
					format.json { render :json => {:auction => @auction, :bidder => {:name => "None"} , :message => "Bid is lower then starting bid"}}
				end
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
		if @auction.bidder != nil
			@bidder = User.find(@auction.bidder)
		end
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
		params.require(:auction).permit({avatar: []},:title,:category,:user_id, :amount)
	end
	def params_for_bidder
		params.require(:auction).permit(:bidder, :amount)
	end
	def filtering_params(params)
  		params.slice(:title,:category)
	end
end
