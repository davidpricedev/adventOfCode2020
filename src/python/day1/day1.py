from typing import List, Tuple


def part1_1():
    target = 2020
    numbers = load_numbers()
    pair = get_pair(numbers, target)
    result = pair[0] * pair[1]
    print(f"day1_1 result = {result}")


def load_numbers() -> List[int]:
    with open("input.txt", "r") as file:
        return [int(x) for x in file.readlines()]


def get_pair(numbers: List[int], target: int) -> Tuple[int, int]:
    """ get the pair from the list that adds up to the target number """
    lesser_half = [x for x in numbers if x <= target/2]
    for x in lesser_half:
        for y in numbers:
            if x + y == target:
                return x, y
    raise ValueError(f"No pair could be found in the list that adds up to {target}")


def part1_2():
    target = 2020
    numbers = load_numbers()
    triple = get_triple(numbers, target)
    result = triple[0] * triple[1] * triple[2]
    print(f"day1_2 result = {result}")

def get_triple(numbers: List[int], target: int) -> Tuple[int, int, int]:
    """ get the triple from the list that adds up to the target number """
    for x in numbers:
        for y in numbers:
            if x + y < target:
                for z in numbers:
                    if x + y + z == target:
                        return x, y, z
    raise ValueError(f"No triple could be found in the list that adds up to {target}")


if __name__ == "__main__":
    part1_1()
    part1_2()
