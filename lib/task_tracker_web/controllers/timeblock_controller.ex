defmodule TaskTrackerWeb.TimeblockController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.Timeblocks
  alias TaskTracker.Timeblocks.Timeblock

  def index(conn, _params) do
    timeblocks = Timeblocks.list_timeblocks()
    render(conn, "index.html", timeblocks: timeblocks)
  end

  def new(conn, _params) do
    changeset = Timeblocks.change_timeblock(%Timeblock{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"timeblock" => timeblock_params}) do
    case Timeblocks.create_timeblock(timeblock_params) do
      {:ok, timeblock} ->
        conn
        |> put_flash(:info, "Timeblock created successfully.")
        |> redirect(to: Routes.timeblock_path(conn, :show, timeblock))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    timeblock = Timeblocks.get_timeblock!(id)
    render(conn, "show.html", timeblock: timeblock)
  end

  def edit(conn, %{"id" => id}) do
    timeblock = Timeblocks.get_timeblock!(id)
    changeset = Timeblocks.change_timeblock(timeblock)
    render(conn, "edit.html", timeblock: timeblock, changeset: changeset)
  end

  def update(conn, %{"id" => id, "timeblock" => timeblock_params}) do
    timeblock = Timeblocks.get_timeblock!(id)

    case Timeblocks.update_timeblock(timeblock, timeblock_params) do
      {:ok, timeblock} ->
        conn
        |> put_flash(:info, "Timeblock updated successfully.")
        |> redirect(to: Routes.timeblock_path(conn, :show, timeblock))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", timeblock: timeblock, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    timeblock = Timeblocks.get_timeblock!(id)
    {:ok, _timeblock} = Timeblocks.delete_timeblock(timeblock)

    conn
    |> put_flash(:info, "Timeblock deleted successfully.")
    |> redirect(to: Routes.timeblock_path(conn, :index))
  end
end
