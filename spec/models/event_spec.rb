require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'task model features', type: :model do
    let(:user) {FactoryBot.create(:user, email:'user@gmail.com')  } 
    describe 'Test validation' do
      context 'If the Event title is empty' do
        it 'gets caught in the validation' do
          event = Event.new(title: '', image: 'image.png',content: 'failure test', date_start: DateTime.now, date_end: Time.now + 10.days, user: user)
          expect(event).not_to be_valid
        end
      end
    
      context 'if the Event content are empty' do
        it 'gets caught in the validation' do
          # Here's what you need to know
          event = Event.new(title: 'title test', image: 'image.png',content: '', date_start: DateTime.now, date_end: Time.now + 10.days, user: user)
          expect(event).not_to be_valid
        end
      end

      context 'if the Event date_start > date_end' do
        it 'gets caught in the validation' do
          # Here's what you need to know
          event = Event.new(title: 'title test', image: 'image.png',content: 'content test', date_start: Time.now + 10.days, date_end: DateTime.now, user: user)
          expect(event).not_to be_valid
        end
      end

      context 'if the title, Event, date start and date_end of the Event are described in detail' do
        it 'validation passes' do
          # Here's what you need to know
          event = Event.new(title: 'title test', image: 'image.png',content: 'Content Test', date_start: DateTime.now, date_end: Time.now + 10.days, user: user)
          expect(event).to be_valid
        end
      end
    end

  end
end
