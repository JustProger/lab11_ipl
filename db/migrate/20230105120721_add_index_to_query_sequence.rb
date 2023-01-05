# frozen_string_literal: true

class AddIndexToQuerySequence < ActiveRecord::Migration[7.0]
  def change
    add_index :mains, :query_sequence, unique: true
  end
end
