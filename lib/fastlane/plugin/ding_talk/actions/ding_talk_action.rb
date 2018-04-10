require 'fastlane/action'
require_relative '../helper/ding_talk_helper'

module Fastlane
  module Actions
    class DingTalkAction < Action
      def self.run(params)

        UI.message("The ding_talk plugin is working!")

        api_host = 'https://www.pgyer.com/apiv2/app/view'
        api_key = params[:api_key]
        app_key = params[:app_key]
        access_token = params[:access_token]
        markdown_desc = params[:markdown_desc]

        params = {
          '_api_key' => api_key,
          'appKey' => app_key
        }

        # 获取App详细信息
        UI.message("Start get app information from pgyer...")

        response = Net::HTTP.post_form URI(api_host), params
        result = JSON.parse(response.body)["data"]

        # 应用二维码地址
        buildQRCodeURL = result["buildQRCodeURL"]

        # 应用短链接
        buildShortcutUrl = 'https://www.pgyer.com/' + result["buildShortcutUrl"]

        UI.message("Get app information success!")

        puts buildQRCodeURL
        puts buildShortcutUrl
        puts "#{{ 'msgtype' => 'markdown', 'markdown' => {'title': '', 'text': "#{markdown_desc} <br> ![](#{buildQRCodeURL})" } }}"

        Net::HTTP.post URI('https://oapi.dingtalk.com/robot/send?access_token=#{access_token}'),
               { 'msgtype' => 'markdown', 'markdown' => {'title': '', 'text': "#{markdown_desc} <br> ![](#{buildQRCodeURL})" } }.to_json,
               "Content-Type" => "application/json"
        UI.message("Send ding talk success!")

      end

      def self.description
        "Send the packaging information to the ding talk."
      end

      def self.authors
        ["gaoxiang"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Send the packaging information to the ding talk, and provide the qr code for others to install."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :api_key,
                                  env_name: "PGYER_API_KEY",
                               description: "api_key in your pgyer account",
                                  optional: true,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :app_key,
                                  env_name: "PGYER_APP_KEY",
                               description: "app_key for your app",
                                  optional: true,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :access_token,
                                  env_name: "DING_TALK_ROBOT_ACCESS_TOKEN",
                               description: "access_token for your ding talk robot",
                                  optional: true,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :markdown_desc,
                                  env_name: "DING_TALK_APP_DESCRIPTION",
                               description: "description for your app",
                                  optional: false,
                                      type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
