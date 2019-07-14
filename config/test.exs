use Mix.Config

config :logger, level: :error

# Set simple/sane defaults for local testing and CI.
config :access_pass, :ecto_repos, [AccessPass.Repo]
config :access_pass, AccessPass.Repo,
  username: "postgres",
  password: "postgres",
  database: "access_pass_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  priv: "test/"
config :access_pass, AccessPass.Mailer,
  adapter: Bamboo.TestAdapter
config :access_pass,
  from: "info@test-email.com"

# Set arbitrary expiration to pass tests
config :access_pass, :access_expire_in, 5

# Load CI config in Travis
if System.get_env("CI") == "true", do: import_config "ci.exs"
