class AddFieldsToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :game_id, :integer
    add_column :messages, :team_name, :string
  end
end
