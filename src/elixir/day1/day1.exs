defmodule AdventOfCode2020.Day1 do
  def parseint(strval), do: elem(Integer.parse(strval), 0)

  def load_numbers do
    strings = File.read("day1.input") |> elem(1) |> String.split("\n", trim: true)
    Enum.map strings, &parseint/1
  end

  def cartesian_product(a, b) do
    for x <- a, y <- b, do: {x, y}
  end

  def part1_reducer({x, y}, nil) when x + y == 2020, do: {x, y}
  def part1_reducer({_, _}, nil), do: nil
  def part1_reducer({_, _}, acc), do: acc

  def day1_part1 do
    numbers = load_numbers()
    tuples = cartesian_product(numbers, numbers)
    {x , y} = Enum.reduce tuples, nil, &part1_reducer/2
    {x, y, x * y}
  end

  def part2_reducer({x, y, z}, nil) when x + y + z == 2020, do: {x,y,z}
  def part2_reducer({_, _, _}, nil), do: nil
  def part2_reducer({_, _, _}, acc), do: acc

  def day1_part2 do
    numbers = load_numbers()
    triples = for x <- numbers, y <- numbers, z <- numbers, do: {x,y,z}
    {x,y,z} = Enum.reduce triples, nil, &part2_reducer/2
    {x, y, z, x * y * z}
  end

  def main do
    {day1_part1(), day1_part2()}
  end
end


IO.inspect AdventOfCode2020.Day1.main()
System.halt(0)
