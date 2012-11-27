class RemoveOwnerFromUnits < ActiveRecord::Migration
  def up
    remove_column :units, :owner
      end

  def down
    add_column :units, :owner, :string
  end
end
