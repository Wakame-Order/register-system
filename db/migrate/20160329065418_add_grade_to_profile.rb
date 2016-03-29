class AddGradeToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :grade, :string
  end
end
