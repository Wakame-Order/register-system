class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :gender
      t.string :status_flag
      t.string :enter_year
      t.string :major

      t.timestamps
    end
  end
end
