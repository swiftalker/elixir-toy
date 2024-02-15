defmodule ElixirToyWeb.CountersLiveTest do
  use ElixirToyWeb.ConnCase

  import Phoenix.LiveViewTest
  import ElixirToy.CounterFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_counters(_) do
    counters = counters_fixture()
    %{counters: counters}
  end

  describe "Index" do
    setup [:create_counters]

    test "lists all counters", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/counters")

      assert html =~ "Listing Counters"
    end

    test "saves new counters", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/counters")

      assert index_live |> element("a", "New Counters") |> render_click() =~
               "New Counters"

      assert_patch(index_live, ~p"/counters/new")

      assert index_live
             |> form("#counters-form", counters: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#counters-form", counters: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/counters")

      html = render(index_live)
      assert html =~ "Counters created successfully"
    end

    test "updates counters in listing", %{conn: conn, counters: counters} do
      {:ok, index_live, _html} = live(conn, ~p"/counters")

      assert index_live |> element("#counters-#{counters.id} a", "Edit") |> render_click() =~
               "Edit Counters"

      assert_patch(index_live, ~p"/counters/#{counters}/edit")

      assert index_live
             |> form("#counters-form", counters: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#counters-form", counters: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/counters")

      html = render(index_live)
      assert html =~ "Counters updated successfully"
    end

    test "deletes counters in listing", %{conn: conn, counters: counters} do
      {:ok, index_live, _html} = live(conn, ~p"/counters")

      assert index_live |> element("#counters-#{counters.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#counters-#{counters.id}")
    end
  end

  describe "Show" do
    setup [:create_counters]

    test "displays counters", %{conn: conn, counters: counters} do
      {:ok, _show_live, html} = live(conn, ~p"/counters/#{counters}")

      assert html =~ "Show Counters"
    end

    test "updates counters within modal", %{conn: conn, counters: counters} do
      {:ok, show_live, _html} = live(conn, ~p"/counters/#{counters}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Counters"

      assert_patch(show_live, ~p"/counters/#{counters}/show/edit")

      assert show_live
             |> form("#counters-form", counters: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#counters-form", counters: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/counters/#{counters}")

      html = render(show_live)
      assert html =~ "Counters updated successfully"
    end
  end
end
