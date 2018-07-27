class LessonWord < ApplicationRecord
  belongs_to :word_answer, optional: true
  belongs_to :word
  belongs_to :lesson
end
