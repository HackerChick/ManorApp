class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :choice

      t.timestamps
    end
  end
end
