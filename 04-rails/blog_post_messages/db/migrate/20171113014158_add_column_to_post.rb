class AddColumnToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :blog, foreign_key: true
  end
end
