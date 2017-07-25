# created with: $bin/rails generate model article title:string text:text

class Article < ApplicationRecord
  # our class Article inherits data validation from ApplicationRecord, which inherits from ActiveRecord
  validates :title, presence: true,
                    length: { minimum: 5 }
  # this will ensure that all articles have a title that is at least five characters long
end
