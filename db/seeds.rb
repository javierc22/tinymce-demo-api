# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



posts = [
  {
    title: "Lorem ipsum dolor sit amet 1",
    content:
    "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus dui nec turpis laoreet venenatis. Nullam et posuere erat, non ultricies odio. Sed sagittis, erat ut maximus viverra, mi enim convallis nibh, consectetur feugiat risus velit ut massa. Praesent sodales dui non ex pretium, vitae laoreet risus malesuada. Mauris vitae sollicitudin est, ac tincidunt leo.</p>\n<p>&nbsp;</p>\n<p><strong>Vivamus commodo felis sit amet interdum eleifend. Maecenas porttitor urna mauris, nec mollis quam tempus vitae. Nulla lacinia leo tristique nisl iaculis aliquet.</strong></p>\n<p>&nbsp;</p>\n<p><img src=\"https://cdn.pixabay.com/photo/2021/07/18/17/43/lake-6476212_960_720.jpg\" alt=\"\" width=\"440\" height=\"293\" /></p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>",
    extract: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus ",
  },
  {
    title: "Lorem ipsum dolor sit amet 2",
    content:
    "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus dui nec turpis laoreet venenatis. Nullam et posuere erat, non ultricies odio. Sed sagittis, erat ut maximus viverra, mi enim convallis nibh, consectetur feugiat risus velit ut massa. Praesent sodales dui non ex pretium, vitae laoreet risus malesuada. Mauris vitae sollicitudin est, ac tincidunt leo.</p>\n<p>&nbsp;</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus dui nec turpis laoreet venenatis. Nullam et posuere erat, non ultricies odio. Sed sagittis, erat ut maximus viverra, mi enim convallis nibh, consectetur feugiat risus velit ut massa. Praesent sodales dui non ex pretium, vitae laoreet risus malesuada. Mauris vitae sollicitudin est, ac tincidunt leo.</p>\n<p>&nbsp;</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus dui nec turpis laoreet venenatis. Nullam et posuere erat, non ultricies odio. Sed sagittis, erat ut maximus viverra, mi enim convallis nibh, consectetur feugiat risus velit ut massa. Praesent sodales dui non ex pretium, vitae laoreet risus malesuada. Mauris vitae sollicitudin est, ac tincidunt leo.</p>\n<p>&nbsp;</p>\n<p><iframe style=\"width: 565px; height: 317px;\" src=\"https://www.youtube.com/embed/eBpq7MctZcc?ab_channel=japaninpoika\" width=\"565\" height=\"317\" allowfullscreen=\"allowfullscreen\"></iframe></p>",
    extract: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus",
  },
  {
    title: "Lorem ipsum dolor sit amet 3",
    content:
    "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus dui nec turpis laoreet venenatis. Nullam et posuere erat, non ultricies odio. Sed sagittis, erat ut maximus viverra, mi enim convallis nibh, consectetur feugiat risus velit ut massa. Praesent sodales dui non ex pretium, vitae laoreet risus malesuada. Mauris vitae sollicitudin est, ac tincidunt leo.</p>\n<p>&nbsp;</p>\n<p><strong>Vivamus commodo felis sit amet interdum eleifend. Maecenas porttitor urna mauris, nec mollis quam tempus vitae. Nulla lacinia leo tristique nisl iaculis aliquet.</strong></p>\n<p>&nbsp;</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus dui nec turpis laoreet venenatis. Nullam et posuere erat, non ultricies odio. Sed sagittis, erat ut maximus viverra, mi enim convallis nibh, consectetur feugiat risus velit ut massa. Praesent sodales dui non ex pretium, vitae laoreet risus malesuada. Mauris vitae sollicitudin est, ac tincidunt leo.</p>\n<p>&nbsp;</p>\n<p><strong>Vivamus commodo felis sit amet interdum eleifend. Maecenas porttitor urna mauris, nec mollis quam tempus vitae. Nulla lacinia leo tristique nisl iaculis aliquet.</strong></p>\n<p>&nbsp;</p>\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus dui nec turpis laoreet venenatis. Nullam et posuere erat, non ultricies odio. Sed sagittis, erat ut maximus viverra, mi enim convallis nibh, consectetur feugiat risus velit ut massa. Praesent sodales dui non ex pretium, vitae laoreet risus malesuada. Mauris vitae sollicitudin est, ac tincidunt leo.</p>\n<p>&nbsp;</p>\n<p><strong>Vivamus commodo felis sit amet interdum eleifend. Maecenas porttitor urna mauris, nec mollis quam tempus vitae. Nulla lacinia leo tristique nisl iaculis aliquet.</strong></p>",
    extract: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus",
  },
  {
    title: "Lorem ipsum dolor sit amet 4",
    content:
    "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus dui nec turpis laoreet venenatis. Nullam et posuere erat, non ultricies odio. Sed sagittis, erat ut maximus viverra, mi enim convallis nibh, consectetur feugiat risus velit ut massa. Praesent sodales dui non ex pretium, vitae laoreet risus malesuada. Mauris vitae sollicitudin est, ac tincidunt leo.</p>\n<p>&nbsp;</p>\n<p><strong>Vivamus commodo felis sit amet interdum eleifend. Maecenas porttitor urna mauris, nec mollis quam tempus vitae. Nulla lacinia leo tristique nisl iaculis aliquet.</strong></p>",
    extract: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur faucibus",
  }
]


posts.each do |post|
  Post.create(title: post[:title], extract: post[:extract], content: post[:content])
end