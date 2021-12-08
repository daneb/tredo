# frozen_string_literal: true

require "test_helper"
require "jsender"
require "json"

class TodoTest < MiniTest::Test
  def test_success_creating_task
    restclient = MiniTest::Mock.new
    response = DummyResponse.new(200, "Created")
    restclient.expect :post, response, [String, Hash]
    todo = Tredo::Todo.new(restclient)
    todo.token = "some_token"
    todo.key = "some_key"

    result = JSON.parse(todo.create_card("hello"))

    assert_equal result["status"], "success"
    assert_equal result["data"]["result"], "Created"
    restclient.verify
  end

  def test_failed_task_creation
    restclient = MiniTest::Mock.new
    response = DummyErrorResponse.new(500, "Failed to create task.")
    restclient.expect :post, response, [String, Hash]
    todo = Tredo::Todo.new(restclient)
    todo.token = "some_token"
    todo.key = "some_key"

    result = JSON.parse(todo.create_card("hello"))

    assert_equal result["status"], "error"
    assert_equal result["message"], "Failed to create task."
    restclient.verify
  end
end

class DummyResponse
  def initialize(response_code, message)
    @code = response_code
    @body = message
  end

  attr_reader :code, :body
end

class DummyErrorResponse
  def initialize(response_code, message)
    @code = response_code
    @message = message
  end

  attr_reader :code, :message
end
