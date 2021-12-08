# lib/todo.rb
require "rest-client"
require "jsender"

module Tredo
  class Todo
    BOARD_ID = "61af9e0503811b04f6771d00".freeze
    LIST_ID = "61af9e0503811b04f6771d01".freeze
    BASE_URL = "https://api.trello.com/1".freeze

    attr_reader :token, :key

    def initialize(restclient, test_token = nil, test_key = nil)
      @restprovider = restclient
      @token = test_token ||= ENV["PROVIDER_TOKEN"]
      @key = test_key ||= ENV["PROVIDER_KEY"]
    end

    def create_card(name)
      return error("Missing Token or Key") if invalid_auth?

      url = "#{BASE_URL}/cards"
      response = @restprovider.post url, idList: LIST_ID, token: @token, key: @key, name: name
      return error("Failed to create todo.") if response.code != 200

      Jsender::Json.success(data: { "result" => response.body })
    rescue RestClient::Unauthorized
      error("Unauthorized access. No todo created")
    rescue RestClient::BadRequest
      error("Bad request. No todo created")
    end

    def lists
      return error(message: "Missing Token or Key") if invalid_auth?

      url = "#{BASE_URL}/boards/#{BOARD_ID}/lists?token=#{@token}&key=#{@key}"
      response = @restprovider.get url
      return error("Failed to retrieve lists.") if response.code != 200

      Jsender::Json.success(data: { "result" => response.body })
    rescue RestClient::Unauthorized
      error("Unauthorized access.")
    rescue RestClient::BadRequest
      error("Bad request")
    end

    private

    def error(message)
      Jsender::Json.error(message: message)
    end

    def invalid_auth?
      return true if @token.nil? || @token.empty?
      return true if @key.nil? || @key.empty?

      false
    end
  end
end
