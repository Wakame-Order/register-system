class AddGrageToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :grage, :string
  end
end
