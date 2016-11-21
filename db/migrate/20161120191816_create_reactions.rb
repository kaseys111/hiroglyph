class CreateReactions < ActiveRecord::Migration
  def change
    create_table :reactions do |t|
      t.string :reaction
      t.integer :status_id
      t.integer :user_id

      t.timestamps

    end
  end
end
