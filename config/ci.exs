use Mix.Config

IO.puts("\nTravisCI Build...\n")
config :access_pass, AccessPass.Repo,
  username: "postgres",
  password: ""
