require 'faker'

# comment
class Author
  attr_reader :name, :biography

  def initialize(name)
    @name = name
    @biography = Faker::Lorem.paragraph
  end
end
