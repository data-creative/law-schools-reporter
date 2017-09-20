class CreateEmploymentReports < ActiveRecord::Migration[5.1]
  def change
    create_table :employment_reports do |t|
      t.string :school_name, null: false
      t.integer :year, null: false
      t.integer :total_grads
      t.integer :total_employed
      t.text :employment_types
      t.text :employment_statuses
      t.text :employment_locations

      t.timestamps
    end

    add_index :employment_reports, :school_name
    add_index :employment_reports, :year
    add_index :employment_reports, [:school_name, :year], unique: true
  end
end
