class AddCommentsPostsFkToComments < ActiveRecord::Migration
  def change
    add_foreign_key :comments, :posts
  end
end
