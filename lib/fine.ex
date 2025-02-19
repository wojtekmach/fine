defmodule Fine do
  @external_resource "README.md"

  [_, readme_docs, _] =
    "README.md"
    |> File.read!()
    |> String.split("<!-- Docs -->")

  @moduledoc readme_docs

  @include_dir Path.expand("include")

  @doc """
  Returns the directory with Fine header files.
  """
  @spec include_dir() :: String.t()
  def include_dir(), do: @include_dir
end
