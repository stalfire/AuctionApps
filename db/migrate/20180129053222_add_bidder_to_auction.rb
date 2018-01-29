class AddBidderToAuction < ActiveRecord::Migration[5.0]
  def change
  	add_column :auctions, :bidder, :integer
  	add_column :auctions, :amount, :integer
  end
end
