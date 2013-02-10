require 'spec_helper'

describe 'client index page' do
    describe 'client list' do
        #before :each do
	    #Client.make (first_name: 'Mildon', last_name: 'Friedman', :email => 'milf@example.com')
	#end
        it 'Adding Client adds item to list', js: true  do
            visit '/'
	    
	    within('#client') do
              page.should have_content('New Client')
	      fill_in 'First name', with: 'Sandy'
              fill_in 'Last name', with: 'Beach'
	      fill_in 'Email', with: 'sandyb@gmail.com'
	      fill_in 'Phone', with: '3141592654'
	      fill_in 'Address', with: '230 Oceanside Ave.'
	      fill_in 'City', with: 'Miami'
	      fill_in 'State', with: 'Florida'
	      fill_in 'Zip', with: '30948'
	      fill_in 'Comment', with: 'No comment'

	      click_on 'Create Client'
	      
	      #page.should_not have_content('New Client')
	      #page.should have_content('Editing Client')
	    end
	end
    end
end
