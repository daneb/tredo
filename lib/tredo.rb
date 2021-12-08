# frozen_string_literal: true

require_relative "tredo/version"
require "tredo/restprovider"

module Tredo
  def self.create_todo(name)
    restclient = RestProvider.new
    todo = Todo.new(restclient)
    todo.create_card(name)
  end
end

require "tredo/todo"
