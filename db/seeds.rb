 require 'random_data'

 # Create Posts
 Post.find_or_create_by!(
    title: "unique title",
    body: "This body is very unique. No other bodies are like this one."
 )
 50.times do
   Post.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 Comment.find_or_create_by!(
   post: Post.find_or_create_by(title: "unique title"),
   body: "This is a unique but idempotent body."
 )     
 100.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
