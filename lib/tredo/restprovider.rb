# lib/restprovider.rb
#
require "rest-client"

module Tredo
  class RestProvider
    def initialize
      @restclient = RestClient
    end

    def get(url, *params)
      @restclient.get url, *params
    end

    def post(url, *params)
      @restclient.post url, *params
    end
  end
end
