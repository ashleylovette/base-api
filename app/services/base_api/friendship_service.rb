# frozen_string_literal: true

module BaseApi
 
    module FriendshipService
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
      def self.remove_friend(friend_id, current_user_id)
        record1 = Friendship.find_by(user_id: current_user_id, friend_id: friend_id).destroy
        record2 = Friendship.find_by(user_id: friend_id, friend_id: current_user_id).destroy
        friend = User.find(friend_id)
        user = User.find(current_user_id)
        return ServiceContract.error(friend) unless record1.destroyed? && record2.destroyed?
        friendship = ["user_email": user.email, "friend_email": friend.email]
        ServiceContract.success(friendship)
      end

    end
  end