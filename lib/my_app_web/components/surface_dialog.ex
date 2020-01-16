defmodule MyAppWeb.Components.SurfaceDialog do
  use Surface.LiveComponent

  def mount(socket) do
    {:ok, assign(socket, show: false)}
  end

  def render(assigns) do
    ~H"""
    <div id="editor">
      <div :if={{ @show }} phx-hook="editor">
        <div class="modal-background"></div>
        <div class="modal-card">
          <div id="ace-editor"></div>
        </div>
      </div>
    </div>
    """
  end

  # Public API

  def show(dialog_id) do
    send_update(__MODULE__, id: dialog_id, show: true)
  end

  # Event handlers

  def handle_event("show", _, socket) do
    {:noreply, assign(socket, show: true)}
  end

  def handle_event("save", _, socket) do
    {:noreply, assign(socket, show: false)}
  end

  def handle_event("cancel", _, socket) do
    {:noreply, assign(socket, show: false)}
  end
end
