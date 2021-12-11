# frozen_string_literal: true

require_relative "tredo/version"
require "tredo/restprovider"

module Tredo
  def self.create_todo(name, token = nil, key = nil)
    restclient = RestProvider.new
    todo = Todo.new(restclient, token, key)
    todo.create_card(name)
  end

  def self.todo_lists(token = nil, key = nil)
    restclient = RestProvider.new
    todo = Todo.new(restclient, token, key)
    todo.lists
  end

  def self.todos_for_list(list_id, token = nil, key = nil)
    restclient = RestProvider.new
    todo = Todo.new(restclient, token, key)
    todo.cards(list_id)
  end
end

require "tredo/todo"
