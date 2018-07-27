class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.integer :category, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
