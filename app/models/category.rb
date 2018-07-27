class Category < ApplicationRecord
    validates :title, presence: true, length: { maximum: 15}
    validates :description, presence: true, length: { maximum: 30}

    has_many :words

    has_many :lessons
    has_many :users, through: :lessons
end
