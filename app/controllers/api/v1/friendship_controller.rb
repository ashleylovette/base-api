module Api
  module V1
    class FriendshipController < ApplicationController
      def add_friend
        result= BaseApi::Friendship.save_friend(params[:friend_id], params[:current_user_id])
        render_error(errors: "Could not add #{result.payload.email} as a friend", status: 401) and return unless result.success?
          payload= {
          success: "#{@current_user.email} added #{result.payload.email} as a friend"
          }
        render_success(payload: payload)
      end

      def remove_friend
        result = BaseApi::Friendship.remove_friend(params[:friend_id], params[:current_user_id])
        render_error(errors: "Could not delete #{result.payload.email} as a friend", status: 401) and return unless result.success?
        payload = {
          success: "#{@current_user.email} removed #{result.payload.email} as a friend"
        }
        render_success(payload: payload)
      end
    
    end
  end
end


