use Mix.Config
use Logger

Logger.info("TravisCI Build...")
config :access_pass, AccessPass.Repo,
  username: "postgres",
  password: ""
