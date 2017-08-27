defmodule Cex.BaseExchange do
  def ticker(_symbol), do: raise "Not implemented"
end
