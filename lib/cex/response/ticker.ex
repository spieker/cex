defmodule Cex.Response.Ticker do
  @enforce_keys [:mid, :timestamp]
  defstruct [:ask, :bid, :high, :last_price, :low, :mid, :timestamp, :volume]
end
