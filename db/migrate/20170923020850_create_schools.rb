class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :url, null:false
      t.string :name, null:false
      t.integer :year, null:false
      t.integer :uuid
      t.text :alt_names

      t.timestamps
    end

    add_index :schools, :url, unique: true
  end
end
