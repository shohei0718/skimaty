class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.string    :title,      null:false

      t.text      :sumary,     null:false
      t.text      :note
      t.text      :image

      t.integer   :price, null:false
      t.integer   :attempt

      t.references :genre,      foreign_key:true
      t.references :condition,  foreign_key:true
      t.references :user,       foreign_key:true

      t.timestamps
    end
  end
end
