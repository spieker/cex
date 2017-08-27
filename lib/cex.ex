defmodule Cex do
  @moduledoc """
  Provides a unified interface to access the API of different crypto currency
  exchanges.
  """

  @doc """
  Requests the current btc/usd value from the given exchange.

  ## Parameters

    - adapter: The adapter to use for the request (i.e. `Cex.Bitfinex`)

  ## Examples

    iex> Cex.ticker(Cex.Bitfinex)
    {:ok,
      %Cex.Response.Ticker{ask: 4259.8, bid: 4259.2, high: 4464.2,
       last_price: 4259.9, low: 4240.7, mid: 4259.5,
       timestamp: 1503751008.2897568, volume: 25169.97898037}}

  """
  @spec ticker(module) :: Cex.Response.Ticker.t
  def ticker(adapter), do: ticker(adapter, "btcusd")

  @doc """
  Requests the current value of the given currency pairs from the given
  exchange.

  ## Parameters

    - adapter: The adapter to use for the request (i.e. `Cex.Bitfinex`)
    - symbol: String defining the symbol combination (i.e. iotbtc)

  ## Examples

    iex> Cex.ticker(Cex.Bitfinex, "btcusd")
    {:ok,
      %Cex.Response.Ticker{ask: 4259.8, bid: 4259.2, high: 4464.2,
       last_price: 4259.9, low: 4240.7, mid: 4259.5,
       timestamp: 1503751008.2897568, volume: 25169.97898037}}

    iex> Cex.ticker(Cex.Bitfinex, "iotbtc")
    {:ok,
      %Cex.Response.Ticker{ask: 2.1663e-4, bid: 2.1468e-4, high: 2.175e-4,
        last_price: 2.175e-4, low: 2.0134e-4, mid: 2.15655e-4,
        timestamp: 1503771918.674622, volume: 4837248.50766449}}

  """
  @spec ticker(module, String.t) :: Cex.Response.Ticker.t
  def ticker(adapter, symbol) do
    body = adapter.ticker(symbol)
    {:ok, struct(Cex.Response.Ticker, body)}
  rescue
    ex in Tesla.Error -> {:error, ex}
  end
end
