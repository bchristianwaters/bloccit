 class FavoriteMailer < ApplicationMailer
   default from: "christianwaters1993@gmail.com"

   def new_comment(user, post, comment)
 
     headers["Message-ID"] = "<comments/#{comment.id}@ancient-temple-28002.herokuapp.com/>"
     headers["In-Reply-To"] = "<post/#{post.id}@ancient-temple-28002.herokuapp.com/>"
     headers["References"] = "<post/#{post.id}@ancient-temple-28002.herokuapp.com/>"
 
     @user = user
     @post = post
     @comment = comment
 
     mail(to: user.email, subject: "New comment on #{post.title}")
   end
   
   def new_post(user, post)
     
     headers["Message-ID"] = "<post/#{post.id}@ancient-temple-28002.herokuapp.com/>"
     headers["In-Reply-To"] = "<post/#{post.id}@ancient-temple-28002.herokuapp.com/>"
     headers["References"] = "<post/#{post.id}@ancient-temple-28002.herokuapp.com/>"
     
     @user = user
     @post = post
     
     mail(to: user.email, subject: "You created and are now following #{post.title}") 
   end
 end
