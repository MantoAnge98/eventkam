class CustomForeignKeyParticipantsTable < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :participants, :users
    remove_column :participants, :user_id
    add_reference :participants, :participants, references: :users, index:true
    add_foreign_key :participants, :users, column: :participants_id
  end
end
