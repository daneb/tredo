# frozen_string_literal: true

require_relative "tredo/version"
require "tredo/restprovider"

module Tredo
  def self.create_todo(name)
    restclient = RestProvider.new
    todo = Todo.new(restclient)
    todo.create_card(name)
  end

  def self.todo_lists
    restclient = RestProvider.new
    todo = Todo.new(restclient)
    todo.lists
  end
end

require "tredo/todo"
