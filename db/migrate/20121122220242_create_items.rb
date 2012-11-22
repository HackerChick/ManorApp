class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.decimal :cost, :precision => 8, :scale => 2
      t.text :description

      t.timestamps
    end
  end
end
