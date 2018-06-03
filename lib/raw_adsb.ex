defmodule RawAdsb do
  @moduledoc """
  Defines and parses the raw adsb packet
  """

  @enforce_keys [:df, :ca, :icao, :tc, :data, :parity]
  defstruct [:df, :ca, :icao, :tc, :data, :parity]

  @doc """
  Parse ADS-B messages

  """
  def parse(input) do
    <<
      df      :: size(5),
      ca      :: size(3),
      icao    :: size(24),
      tc      :: size(5),
      data    :: size(51),
      parity  :: size(24)
    >> = input

    %RawAdsb{
      df: df,
      ca:  ca,
      icao: icao,
      tc: tc,
      data: data,
      parity: parity
    }

  end
end
