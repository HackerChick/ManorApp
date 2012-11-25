class AddUnitsAndItemsToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :unit_id, :integer

    add_column :votes, :item_id, :integer

  end
end
