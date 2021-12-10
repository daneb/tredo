# frozen_string_literal: true

require "test_helper"
require "jsender"
require "json"

class TodoTest < MiniTest::Test
  describe "when creating a task" do
    def test_success
      restclient = MiniTest::Mock.new
      response = DummyResponse.new(200, "Created")
      restclient.expect :post, response, [String, Hash]
      todo = Tredo::Todo.new(restclient, "some_token", "some_key")

      result = JSON.parse(todo.create_card("hello"))

      assert_equal result["status"], "success"
      assert_equal result["data"]["result"], "Created"
      restclient.verify
    end

    def test_failed_task_creation
      restclient = MiniTest::Mock.new
      response = DummyErrorResponse.new(500, "Internal Error Yikes!")
      restclient.expect :post, response, [String, Hash]
      todo = Tredo::Todo.new(restclient, "some_token", "some_key")

      result = JSON.parse(todo.create_card("hello"))

      assert_equal result["status"], "error"
      assert_equal result["message"], "Failed to create todo."
      restclient.verify
    end
  end

  describe "when getting lists of todos" do
    def test_success
      restclient = MiniTest::Mock.new
      response = DummyResponse.new(200, "Some Fake List")
      restclient.expect :get, response, [String]
      todo = Tredo::Todo.new(restclient, "some_token", "some_key")

      result = JSON.parse(todo.lists)

      assert_equal result["status"], "success"
      assert_equal result["data"]["result"], "Some Fake List"
      restclient.verify
    end

    def test_failure_getting_lists
      restclient = MiniTest::Mock.new
      response = DummyErrorResponse.new(500, "Internal Error Yikes!")
      restclient.expect :get, response, [String]
      todo = Tredo::Todo.new(restclient, "some_token", "some_key")

      result = JSON.parse(todo.lists)

      assert_equal result["status"], "error"
      assert_equal result["message"], "Failed to retrieve lists."
      restclient.verify
    end
  end

  describe "when getting actions from a list" do
    def test_success
      fake_listid = "61af9e0503811b04f6771d01"
      restclient = MiniTest::Mock.new
      response = DummyResponse.new(200, "Some Fake Actions")
      restclient.expect :get, response, [String]
      todo = Tredo::Todo.new(restclient, "some_token", "some_key")

      result = JSON.parse(todo.actions(fake_listid))

      assert_equal result["status"], "success"
      assert_equal result["data"]["result"], "Some Fake Actions"
      restclient.verify
    end

    def test_failure_getting_actions
      fake_listid = "61af9e0503811b04f6771d01"
      restclient = MiniTest::Mock.new
      response = DummyErrorResponse.new(500, "Internal Error Yikes!")
      restclient.expect :get, response, [String]
      todo = Tredo::Todo.new(restclient, "some_token", "some_key")

      result = JSON.parse(todo.actions(fake_listid))

      assert_equal result["status"], "error"
      assert_equal result["message"], "Failed to retrieve actions for list."
      restclient.verify
    end
  end

  describe "when token and key have not been setup" do
    def test_auth_keys_are_verified
      todo = Tredo::Todo.new(nil)
      result = JSON.parse(todo.create_card("hello"))

      assert_equal result["status"], "error"
      assert_equal result["message"], "Missing Token or Key"
    end
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
