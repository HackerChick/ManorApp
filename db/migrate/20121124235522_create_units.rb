class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer :number
      t.string :owner

      t.timestamps
    end
  end
end
