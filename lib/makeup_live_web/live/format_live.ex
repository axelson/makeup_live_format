defmodule MakeupLiveWeb.FormatLive do
  use Phoenix.LiveView
  alias MakeupLiveWeb.PageView

  def mount(_session, socket) do
    text = initial_text()

    assigns = %{
      highlighted: Makeup.highlight(text),
      user_text: initial_text()
    }

    {:ok, assign(socket, assigns)}
  end

  def handle_event("text-update", %{"source" => %{"text" => text}}, socket) do
    # Work around https://github.com/tmbb/makeup/issues/29
    highlighted = text |> String.replace("\r\n", "\n") |> Makeup.highlight()

    assigns = %{
      highlighted: highlighted,
      user_text: text
    }

    socket = assign(socket, assigns)

    {:noreply, socket}
  end

  def render(assigns) do
    PageView.render("index.html", assigns)
  end

  defp initial_text do
    """
    defmodule ExampleModule
      def hello do
        IO.puts("Hello World")
      end
    end
    """
  end
end
