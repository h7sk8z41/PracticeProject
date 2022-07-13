class DeleteUselessModelViews < ActiveRecord::Migration[7.0]
  def change
    drop_table :views
  end
end
