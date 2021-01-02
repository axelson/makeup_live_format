defmodule MakeupLive.MixProject do
  use Mix.Project

  def project do
    [
      app: :makeup_live,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:priv_check, :phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {MakeupLive.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5.0"},
      {:phoenix_pubsub, "~> 2.0"},
      {:phoenix_live_view, "~> 0.15.2"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:makeup_elixir, "~> 0.15.0"},
      {:makeup, "~> 1.0"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.1"},
      {:priv_check, "~> 0.2.2", only: [:dev, :test], runtime: false},
      {:ring_logger, "~> 0.8"},
      # {:exsync, path: "~/dev/forks/exsync"}
      # {:cortex, "~> 0.6.0", only: [:dev, :test]}
      {:cortex, path: "~/dev/forks/cortex", only: [:dev, :test]}
    ]
  end

  defp aliases do
    []
  end
end
