use Mix.Config

if Application.get_env(:access_pass, :repo) == nil do
  import_config "#{Mix.env()}.exs"
end
