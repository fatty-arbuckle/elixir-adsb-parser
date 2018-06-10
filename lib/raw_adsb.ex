defmodule RawAdsb do
  @moduledoc """
  Defines and parses the raw adsb packet
  """

  @enforce_keys [:downlink_format, :capabilities, :icao, :type_code, :data, :parity]
  defstruct [:downlink_format, :capabilities, :icao, :type_code, :data, :parity]

  @doc """
  Parse ADS-B messages

  """
  def parse(input) do
    <<
      downlink_format :: size(5),
      capabilities    :: size(3),
      icao            :: size(24),
      type_code       :: size(5),
      data            :: size(51),
      parity          :: size(24)
    >> = input

    %RawAdsb{
      downlink_format: downlink_format,
      capabilities:  capabilities,
      icao: icao,
      type_code: type_code,
      data: data,
      parity: parity
    }

  end
end
