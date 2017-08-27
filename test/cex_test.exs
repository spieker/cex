defmodule CexTest do
  use ExUnit.Case

  doctest Cex

  describe "#ticker/0" do
    test "exists" do
      assert :erlang.function_exported(Cex, :ticker, 1)
    end
  end

  describe "#ticker/1" do
    test "exists" do
      assert :erlang.function_exported(Cex, :ticker, 2)
    end

    test "returns json" do
      {:ok, data} = Cex.ticker(Cex.TextExchange, "btcusd")
      assert %Cex.Response.Ticker{} = data
    end

    test "sets the mid value" do
      {:ok, data} = Cex.ticker(Cex.TextExchange, "btcusd")
      assert data.mid == 5
    end

    test "sets the timestamp value" do
      {:ok, data} = Cex.ticker(Cex.TextExchange, "btcusd")
      assert data.timestamp == 10
    end
  end
end

defmodule Cex.TextExchange do
  def ticker(_symbol) do
    %{
      mid: 5,
      timestamp: 10
    }
  end
end
