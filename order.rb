require 'faker'

# comment
class Order
  attr_reader :book, :reader, :date

  def initialize(book, reader)
    @book = book
    @reader = reader
    @date = Faker::Date.backward(365)
  end
end
