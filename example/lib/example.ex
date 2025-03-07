defmodule Example do
  @on_load :load_nif
  @mix_build_dir Mix.Project.build_path()

  defp load_nif do
    :erlang.load_nif(~c"#{@mix_build_dir}/example_nif", 0)
  end

  @doc """
  Adds two numbers using NIF.

  ## Examples

      iex> Example.add(1, 2)
      3
  """
  def add(_x, _y) do
    :erlang.nif_error("nif not loaded")
  end
end
