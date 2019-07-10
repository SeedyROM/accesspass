use Mix.Config

config :access_pass, AccessPass.Mailer,
  adapter: Bamboo.SendgridAdapter,
  api_key: "SG.yoursendgridkey"

config :access_pass,
       from: "SENDINGEMAIL@whatever.com"

config :access_pass, :ecto_repos, [AccessPass.Repo]
config :access_pass, AccessPass.Repo, [
  adapter: Ecto.Adapters.Postgres,
  hostname: "localhost",
  username: "postgres",
  password: "postgres",
  database: "access-pass-test",
  pool_size: 10
]
