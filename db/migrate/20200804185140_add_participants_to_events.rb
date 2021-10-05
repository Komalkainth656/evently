class AddParticipantsToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :participants, :float
  end
end
