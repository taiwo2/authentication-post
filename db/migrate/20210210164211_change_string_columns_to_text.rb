class ChangeStringColumnsToText < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :text, :text
  end
end
