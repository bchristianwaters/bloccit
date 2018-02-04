module TopicsHelper
    def user_can_cd_topics?
       current_user && current_user.admin? 
    end
    
    def user_can_u_topics?
        current_user && (current_user.admin? || current_user.moderator?)
    end
end
