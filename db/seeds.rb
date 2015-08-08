SUBREDDIT_COUNT = 10
USER_COUNT = 50
POLYMORPHIC_COUNT = 50
COMMENT_COUNT = 150
POLYMORPHIC_TYPES = ["Comment", "Post", "Link"]

SUBREDDIT_COUNT.times do
  Subreddit.create!(name: Faker::Internet.slug)
end

USER_COUNT.times do
  User.create!(username: Faker::Internet.user_name, password: "1234")
end

POLYMORPHIC_COUNT.times do
  Post.create!(author_id: rand(1..POLYMORPHIC_COUNT),
               subreddit_id: rand(1..SUBREDDIT_COUNT),
               title: Faker::Lorem.sentence,
               body: Faker::Lorem.paragraph)
  Link.create!(author_id: rand(1..POLYMORPHIC_COUNT),
               subreddit_id: rand(1..SUBREDDIT_COUNT),
               title: Faker::Lorem.sentence,
               url: Faker::Internet.url)
end

COMMENT_COUNT.times do
  Comment.create!(author_id: rand(1..POLYMORPHIC_COUNT),
                  commentable_id: rand(1..POLYMORPHIC_COUNT),
                  commentable_type: POLYMORPHIC_TYPES.sample,
                  body: Faker::Hacker::say_something_smart)
  Vote.create!(value: [1, -1].sample,
                votable_id: rand(1..POLYMORPHIC_COUNT),
                votable_type: POLYMORPHIC_TYPES.sample,
                voter_id: rand(1..USER_COUNT))
end
