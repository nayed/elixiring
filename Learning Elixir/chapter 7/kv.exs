defmodule KV do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, [], [name: __MODULE__] ++ opts)
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

  def put(key, value) do
    GenServer.call(__MODULE__, {:put, key, value})
  end

  def get(key) do
    GenServer.call(__MODULE__, {:get, key})
  end
end

defmodule KV.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [worker(KV, [])]

    supervise(children, strategy: :one_for_one)
  end
end
