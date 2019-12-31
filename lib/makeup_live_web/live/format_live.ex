defmodule MakeupLiveWeb.FormatLive do
  use Phoenix.LiveView
  alias MakeupLiveWeb.PageView

  def mount(_session, socket) do
    {:ok, socket}
  end

  def handle_event("text-update", %{"source" => %{"text" => text}}, socket) do
    highlighted = Makeup.highlight(text)
    socket = assign(socket, :highlighted, highlighted)

    {:noreply, socket}
  end

  def render(assigns) do
    PageView.render("todos.html", assigns)
  end
end
