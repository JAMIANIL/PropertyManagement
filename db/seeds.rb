# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'set'

def rand_n(n, max)
    randoms = Set.new
    loop do
        randoms << rand(100..max)
        return randoms.to_a if randoms.size >= n
    end
end

array=rand_n(100,1000)

array.each do |i|
    Lock.create(number:i )
end