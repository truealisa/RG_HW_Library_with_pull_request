require './book.rb'
require './reader.rb'
require './author.rb'
require './order.rb'

# comment
class Library
  attr_reader :readers, :orders, :authors, :books

  def initialize
    @readers = []
    @orders = []
    @authors = []
    @books = []
  end

  def populate_library
    25.times { @books << Book.new }
    15.times { @readers << Reader.new }
    @books.each do |book|
      @authors << Author.new(book.author) unless @authors.include?(book.author)
    end
    40.times { @orders << Order.new(@books.sample.title, @readers.sample.name) }
  end

  def find_most_popular(thing)
    popular_things = []
    @orders.each do |order|
      popular_things << order.send(thing)
    end
    things_count = Hash.new(0)
    popular_things.each { |popular_thing| things_count[popular_thing] += 1 }
    things_count.sort_by { |_name, count| count }
  end

  def most_active_reader
    sorted_readers = find_most_popular('reader')
    puts "#{sorted_readers[-1][0]} is the most active reader in the Library."
    puts "They has ordered #{sorted_readers[-1][1]} books in last year"
  end

  def most_popular_book
    sorted_books = find_most_popular('book')
    puts "\"#{sorted_books[-1][0]}\" is the most popular book in the Library."
    puts "It was ordered #{sorted_books[-1][1]} times in last year"
  end

  def count_readers_of_popular_book
    one_of_most_popular_books = find_most_popular('book').slice(-3, 3).sample
    uniq_readers = []
    @orders.each do |order|
      uniq_readers << order.reader if order.book == one_of_most_popular_books[0]
    end
    uniq_readers.uniq!
    puts "\"#{one_of_most_popular_books[0]}\" is one of 3 the most popular books in the Library."
    puts "It was ordered by #{uniq_readers.size} people in last year"
  end
end
