class RenameTypeColumnToGenres < ActiveRecord::Migration[5.2]
  def change
    rename_column :genres, :type, :genre
  end
end
