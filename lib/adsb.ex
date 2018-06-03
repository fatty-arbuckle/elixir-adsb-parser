defmodule Adsb do
  @moduledoc """
  Documentation for Adsb.
  """

  @doc """
  Parse ADS-B messages

  """
  def parse(input) do
    { :ok,
      raw: RawAdsb.parse(input)
    }
  end
end
