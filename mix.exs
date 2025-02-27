defmodule Jwt.Mixfile do
  use Mix.Project

  def project do
    [app: :jwt,
     version: "0.6.0",
     elixir: "~> 1.3",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [
        applications: [:logger, :httpoison, :cowboy, :plug, :timex],
        mod: {Jwt.Cache.Ets, []}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(:dev),  do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp deps do
    [
    {:httpoison, "~> 1.0" },
    {:poison, "~> 2.0 or ~> 3.0" },
    {:ex_doc, only: :dev, runtime: false, github: "elixir-lang/ex_doc" },
    {:cowboy, "~> 2.5", override: true},
    {:jason, "~> 1.1"},
    {:plug, "~> 1.0"},
    {:stash, "~> 1.0"},
    {:timex, "~> 3.0"}
    ]
  end
end
