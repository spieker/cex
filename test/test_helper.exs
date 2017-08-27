ExUnit.start()

defmodule Cex.Tesla.MockAdapter do
  use Tesla

  def call(env, _opts) do
    body    = res(env.method, env.url)
    headers = %{"Content-Type" => "application/json"}
    %{env | headers: headers, status: 200, body: Poison.encode!(body)}
  end

  def res(:get, "https://api.bitfinex.com/v1/pubticker/btcusd") do
    %{
      mid: "4259.5",
      bid: "4259.2",
      ask: "4259.8",
      last_price: "4259.9",
      low: "4240.7",
      high: "4464.2",
      volume: "25169.97898037",
      timestamp: "1503751008.28975674"
    }
  end

  def res(:get, "https://api.bitfinex.com/v1/pubticker/iotbtc") do
    %{
      mid: "0.000215655",
      bid: "0.00021468",
      ask: "0.00021663",
      last_price: "0.0002175",
      low: "0.00020134",
      high: "0.0002175",
      volume: "4837248.50766449",
      timestamp: "1503771918.674621963"
    }
  end
end
