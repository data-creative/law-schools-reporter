class CreateEmploymentReports < ActiveRecord::Migration[5.1]
  def change
    create_table :employment_reports do |t|
      t.string :school_name, null: false
      t.integer :year, null: false
      t.integer :total_grads
      t.text :findings

      t.timestamps
    end
  end
end
