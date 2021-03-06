# Tredo ๐

Tredo is a gem that acts a seam to some TODO list provider (think Trello, TODOist, RememberTheMilk).
At present it currently supports Trello and as more providers are supported, so to will the facade mature.

- The intent is that the gem would act as seam (for replacement, microservice etc).
- It also aims to affirm the business domain language (create_todo and todo_list) by keeping it consistent through it's main interface (Tredo.class).
- It also aims to mask the complexity of different providers in implementation and language.
- Lastly it also tries to be agnostic to REST Provider by leveraging off the Provider model pattern allowing you to leverage [rest-client](https://github.com/rest-client/rest-client), [faraday](https://github.com/lostisland/faraday) or [http party](https://github.com/jnunemaker/httparty).
- The intended use case for Tredo is as a gem in a Component Based Rails Application (engine).

## Status: Published to [RubyGems](https://rubygems.org/gems/tredo) ๐งจ

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tredo'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install tredo

## Usage

### Requires two environment variables OR token & key passed in via method calls

```bash
export PROVIDER_KEY=<trello-api-key>
export PROVIDER_TOKEN=<trello-api-token>
```

### CLI hacking:

```bash
# irb -Ilib -rtredo
```

### Retrieve Lists

```ruby
irb(main):001:0> Tredo.todo_lists
=> "{\"status\":\"success\",\"data\":{\"result\":\"[{\\\"id\\\":\\\"61af9e0503811b04f6771d01\\\",\\\"name\\\":\\\"To Do\\\",\\\"closed\\\":false,\\\"pos\\\":16384,\\\"softLimit\\\":null,\\\"idBoard\\\":\\\"61af9e0503811b04f6771d00\\\",\\\"subscribed\\\":false},{\\\"id\\\":\\\"61af9e0503811b04f6771d02\\\",\\\"name\\\":\\\"Doing\\\",\\\"closed\\\":false,\\\"pos\\\":32768,\\\"softLimit\\\":null,\\\"idBoard\\\":\\\"61af9e0503811b04f6771d00\\\",\\\"subscribed\\\":false}]\"}}"
```

### Create Task

```ruby
irb(main):002:0> Tredo.create_todo("TODO For ME")
=> "{\"status\":\"success\",\"data\":{\"result\":\"{\\\"id\\\":\\\"61b10b7485298e285d4a5e65\\\",\\\"checkItemStates\\\":[],\\\"closed\\\":false,\\\"dateLastActivity\\\":\\\"2021-12-08T19:45:56.916Z\\\",\\\"desc\\\":\\\"\\\",\\\"descData\\\":{\\\"emoji\\\":{}},\\\"dueReminder\\\":null,\\\"idBoard\\\":\\\"61af9e0503811b04f6771d00\\\",\\\"idList\\\":\\\"61af9e0503811b04f6771d01\\\",\\\"idMembersVoted\\\":[],\\\"idShort\\\":15,\\\"idAttachmentCover\\\":null,\\\"idLabels\\\":[],\\\"manualCoverAttachment\\\":false,\\\"name\\\":\\\"TODO For ME\\\",\\\"pos\\\":278527,\\\"shortLink\\\":\\\"jp2WgYtN\\\",\\\"isTemplate\\\":false,\\\"cardRole\\\":null,\\\"dueComplete\\\":false,\\\"due\\\":null,\\\"email\\\":null,\\\"labels\\\":[],\\\"shortUrl\\\":\\\"https://trello.com/c/jp2WgYtN\\\",\\\"start\\\":null,\\\"url\\\":\\\"https://trello.com/c/jp2WgYtN/15-todo-for-me\\\",\\\"cover\\\":{\\\"idAttachment\\\":null,\\\"color\\\":null,\\\"idUploadedBackground\\\":null,\\\"size\\\":\\\"normal\\\",\\\"brightness\\\":\\\"dark\\\",\\\"idPlugin\\\":null},\\\"idMembers\\\":[],\\\"attachments\\\":[],\\\"badges\\\":{\\\"attachmentsByType\\\":{\\\"trello\\\":{\\\"board\\\":0,\\\"card\\\":0}},\\\"location\\\":false,\\\"votes\\\":0,\\\"viewingMemberVoted\\\":false,\\\"subscribed\\\":false,\\\"fogbugz\\\":\\\"\\\",\\\"checkItems\\\":0,\\\"checkItemsChecked\\\":0,\\\"checkItemsEarliestDue\\\":null,\\\"comments\\\":0,\\\"attachments\\\":0,\\\"description\\\":false,\\\"due\\\":null,\\\"dueComplete\\\":false,\\\"start\\\":null},\\\"subscribed\\\":false,\\\"stickers\\\":[],\\\"idChecklists\\\":[],\\\"limits\\\":{}}\"}}"

```

### Communicated Responses

All responses back from the library are in [Jsender](https://github.com/xneelo/jsender) JSON format.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tredo. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/tredo/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Tredo project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tredo/blob/master/CODE_OF_CONDUCT.md).
