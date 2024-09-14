defmodule MakeupLiveWeb.FormatLive do
  require Logger
  use Phoenix.LiveView
  import Phoenix.HTML
  import MakeupLiveWeb.CoreComponents

  def mount(_params, _session, socket) do
    text = initial_text()

    assigns = %{
      highlighted: Makeup.highlight(text),
      user_text: text
    }

    {:ok, assign(socket, assigns)}
  end

  def handle_event("text-update", params, socket) do
    %{"main-textarea" => text} = params
    # Work around https://github.com/tmbb/makeup/issues/29
    highlighted = text |> String.replace("\r\n", "\n") |> Makeup.highlight()

    assigns = %{
      highlighted: highlighted,
      user_text: text
    }

    socket = assign(socket, assigns)

    {:noreply, socket}
  end

  def handle_event(event, params, socket) do
    Logger.warning("Unhandled event #{inspect(event)} with params #{inspect(params)}")
    {:noreply, socket}
  end

  defp initial_text do
    """
    defmodule ExampleModule do
      def hello do
        IO.puts("Hello World")
      end
    end
    """
  end
end
