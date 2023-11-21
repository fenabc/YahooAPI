class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :title
      t.text :explanations
      t.timestamps
    end
  end
end
