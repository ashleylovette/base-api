# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create(slug: "admin")
Role.create(slug: "regular")
user = User.create(email: "ashley@admin.com", password: "password")
user.roles << Role.second
regular = User.create(email: "regular@regular.com", password: "password")
regular.roles << Role.first
regular2 = User.create(email: "regular2@regular.com", password: "password")
regular2.roles << Role.first