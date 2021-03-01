class AddColumnPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :course_id, :integer
  end
end
