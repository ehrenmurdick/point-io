class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :points
      t.integer :party_id

      t.timestamps
    end
  end
end
