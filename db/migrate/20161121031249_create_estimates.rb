class CreateEstimates < ActiveRecord::Migration[5.0]
  def change
    create_table :estimates do |t|

      t.timestamps
    end
  end
end
