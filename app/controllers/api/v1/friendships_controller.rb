# frozen_string_literal: true

module Api
  module V1
    class FriendshipsController < Api::V1::ApplicationController
      skip_before_action :authenticate
      def add_friend
        result= BaseApi::FriendshipService.save_friend(params[:friend_id], params[:current_user_id])
        render_error(errors: "Could not add #{result.payload.email} as a friend", status: 401) and return unless result.success?
          payload= {
          success: "#{@current_user.email} added #{result.payload.email} as a friend"
          }
        render_success(payload: payload)
      end

      def remove_friend
        result = BaseApi::FriendshipService.remove_friend(params[:friend_id], params[:current_user_id])
        render_error(errors: "Could not delete #{result.payload.email} as a friend", status: 401) and return unless result.success?
        current_user = User.find(params[:current_user_id])
        payload = {
          success: "#{result.payload[0][:user_email]} removed #{result.payload[0][:friend_email]} as a friend"
        }
        render_success(payload: payload)
      end
    
    end
  end
end


