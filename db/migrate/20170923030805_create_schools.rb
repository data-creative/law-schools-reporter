class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.integer :uuid, null:false
      t.string :long_name, null:false
      t.string :name, null:false
      t.integer :year_founded
      t.string :url, null:false
      t.string :reports_url

      t.timestamps
    end

    add_index :schools, :uuid, unique: true
    add_index :schools, :long_name, unique: true
    add_index :schools, :name, unique: true
    add_index :schools, :url, unique: true
  end
end
