Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = "Lita"

  # The locale code for the language to use.
  config.robot.locale = :en

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :info

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  # config.robot.admins = ["1", "2"]

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  if ENV["SLACK_TOKEN"]
    config.robot.adapter = :slack
    config.adapters.slack.token = ENV["SLACK_TOKEN"]
  else
    config.robot.adapter = :shell
  end

  ## Example: Set options for the chosen adapter.
  # config.adapter.username = "myname"
  # config.adapter.password = "secret"

  ## Example: Set options for the Redis connection.
  # config.redis.host = "127.0.0.1"
  # config.redis.port = 1234
  config.redis[:url] = ENV["REDISTOGO_URL"] || "redis://localhost:6379"
  config.http.port = ENV["PORT"] || "6000"

  ## Example: Set configuration for any loaded handlers. See the handler's
  ## documentation for options.
  # config.handlers.some_handler.some_config_key = "value"

  config.handlers.twitter_status.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
  config.handlers.twitter_status.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
  config.handlers.twitter_status.access_token = ENV["TWITTER_ACCESS_TOKEN"]
  config.handlers.twitter_status.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end
