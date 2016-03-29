class RemoveGrageFromProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :grage, :string
  end
end
