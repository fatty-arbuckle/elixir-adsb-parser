defmodule WadTest do
  use ExUnit.Case
  doctest Wad

  test "loads csv file" do
    Wad.load("data/aircraft_db.csv")
    assert Wad.lookup("06a0f7") == %{
      "icao" => "06a0f7",
      "mdl" => "a359",
      "operator" => "Qatar Airways",
      "regid" => "a7-alc",
      "type" => "Airbus A350-941"
    }
  end

end
