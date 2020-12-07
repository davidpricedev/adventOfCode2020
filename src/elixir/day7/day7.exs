defmodule AdventOfCode2020.Day7 do
  def input_file, do: "day7.input"

  def main do
    part1()
  end

  def part1 do
    target = "shiny gold"
    result = load_data() |> find_containing(target) |> Enum.count()
    result - 1
  end

  def part2 do

  end

  def find_containing(data, target_color) do
    find_containing_tc(data, MapSet.new([target_color]))
  end

  def find_containing_tc(data, target_colors) when data == [], do: target_colors
  def find_containing_tc(data, target_colors) do
    {remaining_data_a, remaining_data_b} = Enum.split_while(data, fn x -> disjuction(x, target_colors) end)
    remaining_data = cond do
      remaining_data_b == [] -> []
      true -> remaining_data_a ++ tl(remaining_data_b)
    end
    new_color_list = cond do
      remaining_data_b == [] -> target_colors
      true -> MapSet.put(target_colors, remaining_data_b |> hd() |> elem(0) |> String.trim())
    end
    find_containing_tc(remaining_data, new_color_list)
  end

  def disjuction(container, target_colors) do
    contained_colors = container |> elem(1) |> Enum.map(fn x -> x["color"] end) |> MapSet.new()
    MapSet.disjoint?(contained_colors, target_colors)
  end

  def find_contents(data) do
    find_contents_tc(data, 0, shiny_gold_bag)
  end

  def find_contents_tc(data, sum, remaining_bags)

  def parse_line(line) do
    [container_color, parts] = String.split(line, "bags contain ")
    regex = ~r/^(?<number>[[:digit:]]+) (?<color>[[:word:]]+ [[:word:]]+)/
    contained_bags =
      String.split(parts, ", ")
      |> Enum.map(fn x -> Regex.named_captures(regex, x) end)
    {container_color, contained_bags}
  end

  def load_data do
    Enum.map load_lines(input_file()), &parse_line/1
  end

  def load_lines(filename) do
    File.read!(filename) |> String.split("\n", trim: true)
  end
end

IO.inspect(AdventOfCode2020.Day7.main(), limit: :infinity)
System.halt(0)
