defmodule Wad do
  @moduledoc """
  Documentation for World Aircraft Database API
  """

  @doc """
  Loads the WAD from a CSV file
  """
  def load(file) do
    :ets.new(:wad, [:set, :named_table])

    File.stream!(file)
      |> CSV.decode(headers: true)
      |> Enum.each(fn (data) ->
        {:ok, row} = data

        :ets.insert(:wad, {row["icao"], row})
      end)
  end

  def lookup(icao) do
    case Enum.fetch(:ets.lookup(:wad, icao), 0) do
      {:ok, tuple} ->
        elem(tuple, 1)
      :error ->
        :not_found
    end
  end

end
