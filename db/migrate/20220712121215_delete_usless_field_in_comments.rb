class DeleteUslessFieldInComments < ActiveRecord::Migration[7.0]
  def change
    remove_column(:comments,:posts_id )
  end
end
