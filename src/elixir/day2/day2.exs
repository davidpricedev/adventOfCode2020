defmodule AdventOfCode2020.Day2 do
  def parseint(strval), do: elem(Integer.parse(strval), 0)

  def load_data do
    strings = File.read("day2.input") |> elem(1) |> String.split("\n", trim: true)
    Enum.map strings, &parse_line/1
  end

  def parse_line(line) do
    [partsa, password] = String.split(line, ": ")
    [partsb, policy_key] = String.split(partsa, " ")
    [minstr, maxstr] = String.split(partsb, "-")
    {policy_key, parseint(minstr), parseint(maxstr), password}
  end

  def count_char(thestring, char_to_find) do
    string_as_chars = String.graphemes(thestring)
    Enum.filter(string_as_chars, &(&1 == char_to_find)) |> length()
  end

  def is_valid?(actual_count, expected_min, expected_max) when expected_min <= actual_count and actual_count <= expected_max, do: true
  def is_valid?(_, _, _), do: false

  def part1 do
    data = load_data()
    # tack on the count and validity boolean
    result_data = Enum.map(data, fn {k, min, max, pwd} -> {k, min, max, pwd, count_char(pwd, k), is_valid?(count_char(pwd, k), min, max)} end)
    Enum.filter(result_data, fn x -> elem(x, 5) == true end) |> length()
  end

  def part2 do
    # implement
  end

  def main do
    part1()
  end
end


IO.inspect AdventOfCode2020.Day1.main(), limit: :infinity
System.halt(0)
