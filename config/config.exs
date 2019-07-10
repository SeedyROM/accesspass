use Mix.Config

# Load test config only for local testing
with :test <- Mix.env(),
     nil <- Application.get_env(:access_pass, :repo)
do
  import_config "test.exs"
end
