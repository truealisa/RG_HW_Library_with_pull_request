require 'faker'

# comment
class Reader
  attr_reader :name, :email, :city, :street, :house

  def initialize
    @name = Faker::Name.unique.name
    @email = Faker::Internet.unique.email
    @city = Faker::Address.city
    @street = Faker::Address.street_name
    @house = Faker::Address.building_number
  end
end
