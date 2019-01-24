# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ceres,
  ecto_repos: [Ceres.Repo]

# Configures the endpoint
config :ceres, CeresWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fz3rnWAChbm4Y90pGYqYDaiekzqvNSaXgs8uQFZJkL1A9nz2NgjL7mEGN9dyrb5q",
  render_errors: [view: CeresWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Ceres.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Configures Guardian
config :ceres, CeresWeb.Guardian,
  issuer: "ceres",
  secret_key: "tpiK7jYQyf1GWEnC/CboAzxJviL2LX2qSKqThKLWFlSp49e4tPJwDOmObU3EFt5B"

config :ceres, CeresWeb.AuthAccessPipeline,
  module: CeresWeb.Guardian,
  error_handler: CeresWeb.AuthErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# config :ueberauth, Ueberauth,
#   providers: [
#     # Rubikal's team ID
#     slack: {Ueberauth.Strategy.Slack, [team: "T02V520CG"]}
#   ]

# config :ueberauth, Ueberauth.Strategy.Slack.OAuth,
#   client_id: System.get_env("SLACK_CLIENT_ID"),
#   client_secret: System.get_env("SLACK_CLIENT_SECRET")
