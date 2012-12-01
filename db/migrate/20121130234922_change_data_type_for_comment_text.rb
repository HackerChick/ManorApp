class ChangeDataTypeForCommentText < ActiveRecord::Migration
  def up
    change_table :comments do |t|
        t.change :text, :string
    end
  end

  def down
    change_table :comments do |t|
        t.change :text, :text
    end
  end
end
