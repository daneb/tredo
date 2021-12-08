# lib/todo.rb
require "rest-client"
require "jsender"

module Tredo
  class Todo
    BOARD_ID = "61af9e0503811b04f6771d00".freeze
    LIST_ID = "61af9e0503811b04f6771d01".freeze
    BASE_URL = "https://api.trello.com/1".freeze

    attr_accessor :token, :key

    def initialize(restclient)
      @restprovider = restclient
      @token = token.nil? ? token : ENV.fetch("PROVIDER_TOKEN")
      @key = key.nil? ? key : ENV.fetch("PROVIDER_KEY")
    end

    def create_card(name)
      url = "#{BASE_URL}/cards"
      response = @restprovider.post url, idList: LIST_ID, token: @token, key: @key, name: name
      return Jsender::Json.error(message: "Failed to create task.") if response.code != 200

      Jsender::Json.success(data: { "result" => response.body })
    rescue RestClient::Unauthorized
      Jsender::Json.error(message: "Unauthorized access. No task created")
    end
  end
end
