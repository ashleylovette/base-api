# frozen_string_literal: true

module BaseApi
 
    module Friendship
      # Handles adding a friend

      def self.save_friend(friend_id, current_user_id)
        friend = User.find(friend_id)
        current_user = User.find(current_user_id)
        # TODO: If already friend return ServiceContract.error('already friends') unless not friends
        current_user.friends << friend
        friend.friends << current_user
        return ServiceContract.error('error adding friend') unless current_user.friends.find(friend.id)
        ServiceContract.success(friend)
      end


      # Handles removing a friend
      # ToDo: Remove friend association
      
  
      

    
    end
  end