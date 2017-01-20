defmodule Wine.PriceCalculator do

  def calculate do
    [
      %{
        name: "bananas",
        quantity: 4.5
      },
      %{
        name: "wine",
        quantity: 1
      }
    ]
    |> Enum.map(fn(item) -> add_price_to_item(item) end)
    |> add_cost()
    |> IO.inspect
  end

  def price_lookup(%{name: "bananas", quantity: quantity}) do
    0.33 * quantity
  end
  def price_lookup(%{name: "wine", quantity: quantity}) do
    7.99 * quantity
  end
  def price_lookup(_stuff) do
    IO.inspect("ignoring")
    0
  end

  def add_price_to_item(item) do
   item |> Map.merge(%{
      cost: price_lookup(item)
    })
  end

  def add_cost(list) do
    cost = list
    |> Enum.reduce(0, fn(item, acc) -> item.cost + acc end)
    list ++ [%{ cost: cost }]
  end
end