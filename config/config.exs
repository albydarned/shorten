# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :shorten,
  ecto_repos: [Shorten.Repo]

# Configures the endpoint
config :shorten, ShortenWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2ol1TIaiNSUvh8sJ4vGn1B3ukw1jGhr1ChGPSiTlb4UNJq/pQaSAcJSbNLVsDYur",
  render_errors: [view: ShortenWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Shorten.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
