defmodule AdsbTest do
  use ExUnit.Case
  doctest Adsb

  test "parses 8D4840D6202CC371C32CE0576098" do

    expected = {
      :ok,
      raw: %RawAdsb{
        df: 17,
        ca: 5,
        icao: 4735190,
        tc: 4,
        data: 49217938861280,
        parity: 5726360
      }
    }

    {:ok, input} = Base.decode16("8D4840D6202CC371C32CE0576098")
    assert expected == Adsb.parse(input)
  end
end
