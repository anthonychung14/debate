# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Creator.create(email: "anthonychung14@gmail.com")
Author.create([{ full_name: "David Goggins" }, { full_name: "William Lane Craig" }, { full_name: "Siraj Raval" }])
SourceContent.create(title: "Dr Cox Rants", link: "https://www.youtube.com/watch?v=t-b6GIo1g68", content_category: "YOUTUBE")
SourceContent.create(title: "A podcast to scrape", link: "http://content.blubrry.com/52716/20040104TheDoctrineofGodPart1.mp3", content_category: "PODCAST")
