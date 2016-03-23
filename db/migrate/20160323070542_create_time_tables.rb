class CreateTimeTables < ActiveRecord::Migration
  def change
    create_table :time_tables do |t|
      t.integer :user_id
      t.integer :klass_id

      t.timestamps
    end
  end
end
