defmodule MyAppWeb.Live.LiveViewExample do
  use Phoenix.LiveView

  alias MyAppWeb.Components.LVDialog, as: Dialog

  def render(assigns) do
    ~L"""
    <div>
      <%= live_component(@socket, Dialog, id: "editor") %>
      <button phx-click="show" phx-target="#editor">Open (new way)</button>
      <button phx-click="show">Open (old way)</button>
    </div>
    """
  end

  def handle_event("show", _, socket) do
    Dialog.show("editor")
    {:noreply, socket}
  end
end
