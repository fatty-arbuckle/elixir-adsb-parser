defmodule Adsb do
  @moduledoc """
  Documentation for Adsb.
  """

  @doc """
  Parse ADS-B messages

  """
  def parse(input) do
    raw = RawAdsb.parse(input)

    msgType = case raw.type_code do
      tc when tc in 1..4 ->
        "Aircraft identification"
        tc when tc in 5..8 ->
          "Surface position"
        tc when tc in 9..18 ->
          "Airborne position (w/ Baro Altitude)"
        19 ->
          "Airborne velocities"
        tc when tc in 20..22 ->
          "Airborne position (w/ GNSS Height)"
        tc when tc in 23..27 ->
          "Reserved"
        28 ->
          "Aircraft status"
        29 ->
          "Target state and status information"
        31 ->
          "Aircraft operation status"
        _ ->
          :unknown
    end
    {
      :ok,
      message_type: msgType,
      wad: Wad.lookup(Base.encode16(<<raw.icao :: size(24)>>)),
      raw: raw
    }
  end
end
