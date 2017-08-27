defmodule Cex.BitfinexTest do
  use ExUnit.Case

  doctest Cex

  describe "#ticker/1" do
    test "exists" do
      assert :erlang.function_exported(Cex.Bitfinex, :ticker, 1)
    end

    test "returns json" do
      assert is_map(Cex.Bitfinex.ticker("btcusd"))
    end

    test "contains float data for :mid key" do
      data = Cex.Bitfinex.ticker("btcusd")
      assert data[:mid] == 4259.5
    end

    test "contains float data for :timestamp key" do
      data = Cex.Bitfinex.ticker("btcusd")
      assert data[:timestamp] == 1503751008.28975674
    end
  end
end
