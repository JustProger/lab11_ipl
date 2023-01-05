class CreateMains < ActiveRecord::Migration[7.0]
  def change
    create_table :mains do |t|
      t.integer :query_number, null: false
      t.string :query_sequence, null: false
      t.string :sequences, null: false
      t.string :maxsequence, null: false
      t.integer :sequences_number, null: false

      t.timestamps
    end
  end
end
