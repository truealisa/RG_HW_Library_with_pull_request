require 'faker'

# comment
class Book
  attr_reader :title, :author

  def initialize
    @title = Faker::Book.unique.title
    @author = Faker::Book.author
  end
end
