class AddSoldToProperty < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :is_sold, :boolean, default: false
  end
end
