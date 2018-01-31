require 'rails_helper.rb'
RSpec.describe User, :type => :features do 
    feature 'New' do 
        scenario 'can create a user account' do
            visit '/'
            click_link 'sign up'
            fill_in 'Name', with: 'rspec_user' 
            fill_in 'E-mail', with: 'rspec_user@hotmail.com'
            fill_in 'Password', with: 'rspec_user'
            click_button 'Create Account'
            
            expect(page).to have_content('rspec_user')
        end
    end
    feature 'Current' do
        background do
            User.create(name: 'rspec_user1', email: 'rspec_user1@hotmail.com', password: 'rspec_user1')
        end     
        scenario 'can sign in' do
            visit '/'
            click_link 'sign in'
            fill_in 'E-mail', with: 'rspec_user1@hotmail.com'
            fill_in 'Password', with: 'rspec_user1'
            click_button 'Login'

            expect(page).to have_content('rspec_user1')
        end
        scenario 'can edit profile name' do
            visit '/'
            click_link 'sign in'
            fill_in 'E-mail', with: 'rspec_user1@hotmail.com'
            fill_in 'Password', with: 'rspec_user1'
            click_button 'Login'
            click_link 'Edit Profile'
            fill_in 'Name', with: 'rspec_edit'
            click_button 'Update Profile'

            expect(page).to have_content('rspec_edit')
        end
    end
end    