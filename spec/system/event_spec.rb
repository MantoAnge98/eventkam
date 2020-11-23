#bundle exec rspec spec/system/event_spec.rb

require 'rails_helper'

RSpec.describe 'event Management Function', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:second_user)
  end

  describe 'event registration screen' do
    context 'When you fill in the required fields and press the create button' do
      it 'Data is stored.' do
        visit new_user_session_path
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_button 'Log in'
        visit new_event_path
        fill_in 'event[title]', with: "event2"
        fill_in 'event[content]', with: 'Sed ut perspiciatis unde
          omnis iste natus error sit voluptatem
          accusantium doloremque laudantium,
          totam rem aperiam.' 
        fill_in 'event[date_start]', with: DateTime.now
        fill_in 'event[date_end]', with: Time.now + 10.days
        click_on 'Create Event'
        expect(page).to have_content 'event2'
      end
    end

    context 'when user fill wrong field' do
      it 'can not create event without title and content' do
        visit new_user_session_path
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_button 'Log in'
        visit new_event_path
        fill_in 'event[date_start]', with: DateTime.now
        fill_in 'event[date_end]', with: Time.now + 10.days
        click_on 'Create Event'
        expect { raise StandardError, "Title can't be blank"}.to raise_error("Title can't be blank")
        expect { raise StandardError, "Content can't be blank"}.to raise_error("Content can't be blank")
      end
    end

    context 'when user fill wrong field' do
      it 'can not create event without title' do
        visit new_user_session_path
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_button 'Log in'
        visit new_event_path
        fill_in 'event[content]', with: 'Sed ut perspiciatis unde
          omnis iste natus error sit voluptatem
          accusantium doloremque laudantium,
          totam rem aperiam.' 
        fill_in 'event[date_start]', with: DateTime.now
        fill_in 'event[date_end]', with: Time.now + 10.days
        click_on 'Create Event'
        expect { raise StandardError, "Title can't be blank"}.to raise_error("Title can't be blank")
      end
    end

    context 'when user fill wrong field' do
      it 'can not create event without content' do
        visit new_user_session_path
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_button 'Log in'
        visit new_event_path
        fill_in 'event[title]', with: "event2"
        fill_in 'event[date_start]', with: DateTime.now
        fill_in 'event[date_end]', with: Time.now + 10.days
        click_on 'Create Event'
        expect { raise StandardError, "Content can't be blank"}.to raise_error("Content can't be blank")
      end
    end
  end

end