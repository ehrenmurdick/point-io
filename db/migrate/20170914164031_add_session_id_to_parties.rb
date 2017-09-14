class AddSessionIdToParties < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :session_id, :string
  end
end
