class AddBreakendToBreaks < ActiveRecord::Migration[5.2]
  def change
    add_column :breaks, :breakend, :string
  end
end
