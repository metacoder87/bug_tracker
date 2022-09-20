# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bugs = Bug.create([
    { location: "BugTracker/Bug1", description: "This is bug 1"},
    { location: "BugTracker/Bug2", description: "This is bug 2"}
])

Comment.create([
    { body: "Comment on bug 1", bug_id: bugs[0] },
    { body: "Another comment on bug 1", bug_id: bugs[0] }
])