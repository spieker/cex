defmodule Cex.Bitfinex do
  use Tesla, docs: false

  plug Tesla.Middleware.BaseUrl, "https://api.bitfinex.com/v1"
  plug Tesla.Middleware.Headers, %{"User-Agent" => "cex"}
  plug Tesla.Middleware.JSON

  adapter Application.get_env(:cex, :tesla_adapter)

  def ticker(symbol) do
    response = get("/pubticker/" <> symbol)
    for {key, val} <- response.body, into: %{} do
      {num, ""} = Float.parse(val)
      {String.to_atom(key), num}
    end
  end
end
