class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.timestamps
    end
    add_reference :comments, :posts, foreign_key: true
  end
end
