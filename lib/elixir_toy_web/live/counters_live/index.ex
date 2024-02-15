defmodule ElixirToyWeb.CountersLive.Index do
  use ElixirToyWeb, :live_view

  # alias ElixirToy.Counter
  # alias ElixirToy.Counter.Counters

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :counter, 0)}
  end

  @impl true
  def handle_event("increment", _params, socket) do
    {:noreply, update(socket, :counter,  &(&1 + 1))}
  end

  @impl true
  def handle_event("decrement", _params, socket) do
    {:noreply, update(socket, :counter,  &(&1 - 1))}
  end
  # @impl true
  # def handle_params(params, _url, socket) do
  #   {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  # end

  # defp apply_action(socket, :edit, %{"id" => id}) do
  #   socket
  #   |> assign(:page_title, "Edit Counters")
  #   |> assign(:counters, Counter.get_counters!(id))
  # end

  # defp apply_action(socket, :new, _params) do
  #   socket
  #   |> assign(:page_title, "New Counters")
  #   |> assign(:counters, %Counters{})
  # end

  # defp apply_action(socket, :index, _params) do
  #   socket
  #   |> assign(:page_title, "Listing Counters")
  #   |> assign(:counters, nil)
  # end

  # @impl true
  # def handle_info({ElixirToyWeb.CountersLive.FormComponent, {:saved, counters}}, socket) do
  #   {:noreply, stream_insert(socket, :counters_collection, counters)}
  # end

  # @impl true
  # def handle_event("delete", %{"id" => id}, socket) do
  #   counters = Counter.get_counters!(id)
  #   {:ok, _} = Counter.delete_counters(counters)

  #   {:noreply, stream_delete(socket, :counters_collection, counters)}
  # end
end
