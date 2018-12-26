class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string    :title,      null:false
      t.string    :time,       null:false
      t.string    :area,       null:false
      t.string    :way,        null:false
      t.string    :cost
      t.string    :target

      t.text      :sumary,     null:false
      t.text      :note
      t.text      :image1
      t.text      :image2
      t.text      :image3

      t.integer   :price, null:false

      t.references :prefecture, foreign_key:true
      t.references :genre,      foreign_key:true
      t.references :condition,  foreign_key:true
      t.references :user,       foreign_key:true

      t.timestamps
    end
  end
end
