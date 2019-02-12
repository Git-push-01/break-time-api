class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :employeename
      t.belongs_to :company
      t.belongs_to :manager

      t.timestamps
    end
  end
end
