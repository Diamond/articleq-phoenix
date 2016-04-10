# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :articleq, Articleq.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "ZhfF9Lg5w7hr+Kcj2+7R2Gyk7uIJVHuzl5+bgBpHIolnrUmzCQzJBLmvgJ+jLenn",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Articleq.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :guardian, Guardian,
  issuer: "ArticleQ",
  ttl: {30, :days},
  verify_issuer: true,
  secret_key: "ZhfF9Lg5w7hr+Kcj2+7R2Gyk7uIJVHuzl5+bgBpHIolnrUmzCQzJBLmvgJ+jLenn",
  serializer: Articleq.GuardianSerializer

config :phoenix, :format_encoders,
  "json-api": Poison

config :plug, :mimes, %{
  "application/vnd.api+json" => ["json-api"]
}
