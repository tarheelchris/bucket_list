class AddCountToItem < ActiveRecord::Migration
  def change
    add_column :items, :count, :integer
  end
end
