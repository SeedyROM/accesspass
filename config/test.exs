use Mix.Config

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
  adapter: Bamboo.LocalAdapter

# Set arbitrary expiration to pass tests
config :access_pass, :access_expire_in, 5
