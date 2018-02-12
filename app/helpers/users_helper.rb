module UsersHelper
    def no_posts?(user)
        user.posts.count == 0
    end
    
    def no_comments?(user)
       user.comments.count == 0 
    end
end
