class CreateBreaks < ActiveRecord::Migration[5.2]
  def change
    create_table :breaks do |t|
      t.date :breakdate
      t.time :breaktime
      t.belongs_to :company
      t.belongs_to :manager
      t.belongs_to :employee

      t.timestamps
    end
  end
end
