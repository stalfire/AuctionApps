require 'rails_helper'

RSpec.describe Auction, type: :model do
  before(:each) do
        User.create(id: 3, name: 'rspec_user3', email: 'rspec_user3@hotmail.com', password: 'rspec_user3')
    end
  	describe "create" do
  		context "a new auction" do
  			it "to save with user id to test association" do
  				auction = Auction.create(user_id: 3, title: 'Car', category: 'Other')
  				expect(auction).to be_valid
  			end

  			it "not be save with empty title" do
  				auction = Auction.create(user_id: 3, category: "Other")
  				expect(auction).to_not be_valid 
  			end
  		end
  	end
end
