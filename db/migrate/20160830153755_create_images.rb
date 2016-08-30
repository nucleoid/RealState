class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :url
      t.boolean :is_featured
      t.references :property

      t.timestamps
    end

    add_foreign_key :images, :properties, on_delete: :cascade
  end
end
