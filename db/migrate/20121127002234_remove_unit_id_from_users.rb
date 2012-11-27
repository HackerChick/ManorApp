class RemoveUnitIdFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :unit_id
      end

  def down
    add_column :users, :unit_id, :integer
  end
end
