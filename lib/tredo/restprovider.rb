# lib/restprovider.rb
#
require "rest-client"

module Tredo
  class RestProvider
    def initialize
      @restclient = RestClient
    end

    def post(url, *params)
      @restclient.post url, *params
    end
  end
end
