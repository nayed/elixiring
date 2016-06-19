defmodule Forwarder do
  use GenEvent

  def handle_event(event, parent) do
    send parent, event
    {:ok, parent}
  end
end

defmodule Echoer do
  use GenEvent

  def handle_event(event, []) do
    IO.puts event
    {:ok, []}
  end
end
