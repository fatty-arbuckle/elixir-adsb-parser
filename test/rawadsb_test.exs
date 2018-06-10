defmodule RawAdsbTest do
  use ExUnit.Case
  doctest RawAdsb

  test "parses 8D4840D6202CC371C32CE0576098" do

    # 10001
    # 101
    # 010010000100000011010110
    # 00100
    # 000001011001100001101110001110000110010110011100000
    # 010101110110000010011000

    expected = %RawAdsb{
      downlink_format: 17,
      capabilities: 5,
      icao: 4735190,
      type_code: 4,
      data: 49217938861280,
      parity: 5726360
    }

    {:ok, input} = Base.decode16("8D4840D6202CC371C32CE0576098")
    assert expected == RawAdsb.parse(input)
  end
end
