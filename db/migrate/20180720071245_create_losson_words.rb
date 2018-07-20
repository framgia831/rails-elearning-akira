class CreateLossonWords < ActiveRecord::Migration[5.2]
  def change
    create_table :losson_words do |t|
      t.integer :word_answer_id
      t.integer :word_id
      t.integer :lesson_id

      t.timestamps
    end
  end
end
