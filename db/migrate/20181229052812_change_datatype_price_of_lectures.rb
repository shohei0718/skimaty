class ChangeDatatypePriceOfLectures < ActiveRecord::Migration[5.2]
  def change
    change_column :lectures, :price, :string
  end
end
