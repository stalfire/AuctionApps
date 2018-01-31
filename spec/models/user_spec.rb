require 'rails_helper'

RSpec.describe User, type: :model do
  describe "create" do
  		context "a new account" do
  			it "not be save with empty email" do
  				user = User.create(name: 'rspec_user4', password: 'rspec_user4')
  				expect(user).to_not be_valid 
  			end
  		end
  	end
  	describe "Check" do
  		context "User Profile Image" do
  			it "wheather exist" do
  				
  			end
  		end
  	end
end
