defmodule AccessPass.Mixfile do
  use Mix.Project

  def project do
    [
      app: :access_pass,
      name: "AccessPass",
      docs: [
        main: "introduction",
        extras: [
          "doc_extras/introduction.md",
          "doc_extras/getting_started.md",
          "doc_extras/configuration_options.md",
          "doc_extras/phoenix_routes_helper.md",
          "doc_extras/email_template.md",
          "doc_extras/plugs.md"
        ],
        groups_for_extras: [
          "Crash Course": Path.wildcard("doc_extras/*.md")
        ]
      ],
      version: "1.0.2",
      description:
        "Provides a full user authentication experience for an API.
      Includes login,logout,register,forgot password, forgot username, confirmation email and all that other good stuff.
      Includes plug for checking for authenticated users and macro for generating the required routes.",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      aliases: aliases(),
    ]
  end

  def application do
    [extra_applications: [:logger], mod: {AccessPass.Application, []}]
  end

  defp dev_deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
    ]
  end

  defp test_deps do
    [
      {:ecto_sql, ">= 3.0.0", only: :test, runtime: false},
      {:sync_m, "~> 0.1.0", only: :test, runtime: false},
    ]
  end

  defp deps do
    [
      {:bamboo, "~> 0.8"},
      {:ecto, ">= 3.0.0"},
      {:plug, "~> 1.0"},
      {:gettext, "~> 0.11"},
      {:comeonin, "~> 2.0"},
      {:jason, ">= 0.0.0"},
      {:postgrex, ">= 0.0.0"},
    ]
    ++ dev_deps()
    ++ test_deps()
  end

  defp aliases do
    [
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end

  defp package do
    [
      maintainers: ["Jordan Piepkow"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/AppDoctorIo/accesspass"}
    ]
  end
end
