use Mix.Config

# Set simple/sane defaults for local testing and CI.
config :access_pass, :ecto_repos, [AccessPass.Repo]
config :access_pass, AccessPass.Repo, [
  adapter: Ecto.Adapters.Postgres,
  hostname: "localhost",
  username: "postgres",
  password: "postgres",
  database: "access-pass-test",
  pool_size: 10
]
# Set arbitrary expiration to pass tests
config :access_pass, :access_expire_in, 5
