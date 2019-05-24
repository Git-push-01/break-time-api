class ChangeDataTypeForBreaketime < ActiveRecord::Migration[5.2]
  def change
    change_column(:breaks, :breaketime, :string)
end
  end
