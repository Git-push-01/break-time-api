class CreateManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :managers do |t|
      t.string :managername
      t.belongs_to :company

      t.timestamps
    end
  end
end
