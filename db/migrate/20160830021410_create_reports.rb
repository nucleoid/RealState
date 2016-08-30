class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :name
      t.text :sql_query

      t.timestamps
    end
  end
end
