# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :broken_interface, BrokenInterfaceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WiGU2cqTe3dEVxAx7u2+k0BYwEkg+HgzS6teUOX7QwpmfbfS2+na1XwNuPJ1gi09",
  render_errors: [view: BrokenInterfaceWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: BrokenInterface.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
