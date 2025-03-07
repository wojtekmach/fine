defmodule Example.MixProject do
  use Mix.Project

  def project do
    [
      app: :example,
      version: "0.1.0",
      elixir: "~> 1.15",
      compilers: [:elixir_make] ++ Mix.compilers(),
      make_env: fn ->
        %{
          "MIX_BUILD_DIR" => Mix.Project.build_path(),
          "ERL_INCLUDE_DIR" => "#{:code.root_dir()}/usr/include",
          "FINE_INCLUDE_DIR" => Fine.include_dir()
        }
      end,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:elixir_make, "~> 0.9.0"},
      {:fine, path: ".."}
    ]
  end
end
