class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :emp_id
      t.string :password
      t.string :designation
      t.string :qualificaton
      t.date :from_date
      t.date :end_date
      t.boolean :is_super_admin

      t.timestamps
    end
  end
end
