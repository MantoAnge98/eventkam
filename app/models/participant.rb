class Participant < ApplicationRecord
  belongs_to :parts, foreign_key: 'participants_id', class_name: 'User'
  belongs_to :participate, foreign_key: 'event_id', class_name: 'Event'
end
