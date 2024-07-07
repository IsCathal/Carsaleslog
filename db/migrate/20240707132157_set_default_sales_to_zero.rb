class SetDefaultSalesToZero < ActiveRecord::Migration[7.1]
  def change
    change_column_default :salespeople, :salesNumber, from: nil, to: 0
  end
end
