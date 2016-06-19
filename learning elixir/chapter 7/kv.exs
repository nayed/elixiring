defmodule KV do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, [], opts)
  end

  def init(_) do
    {:ok, Map.new}
  end

  def handle_call({:put, key, value}, _from, dictionary) do
    {:reply, :ok, Map.put(dictionary, key, value)}
  end

  def handle_call({:get, key}, _from, dictionary) do
    {:reply, Map.get(dictionary, key), dictionary}
  end
end
