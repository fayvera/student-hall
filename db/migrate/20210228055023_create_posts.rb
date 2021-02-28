class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :student_id
      t.string :title
      t.string :content
      
      t.timestamps null: false
    end
  end
end
