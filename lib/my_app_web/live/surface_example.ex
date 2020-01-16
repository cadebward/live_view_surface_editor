defmodule MyAppWeb.Live.SurfaceExample do
  use Surface.LiveView

  alias MyAppWeb.Components.SurfaceDialog, as: Dialog

  def render(assigns) do
    ~H"""
    <div>
      <Dialog id="editor" />
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
