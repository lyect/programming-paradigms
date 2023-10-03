# List of tasks

✅ 3.1 

    Write a function called "reverse", which reverses a passed list.
    Example: (1 2 3) -> (3 2 1)

✅ 3.2

    Write a function called "reverse-concat", which extends one list with reversed second list.
    Example: (1 2 3), (4 5 6)  -> (3 2 1 4 5 6)

✅ 3.3

    Write a function called "deep-reverse", which deep-reverses a passed list.
    Example: (1 (2 3 4) ((5 6) (7 8))) -> (((8 7) (6 5)) (4 3 2) 1)

✅ 3.4

    Write a function called "reverse-until", which reverses a passed list until specified atom.
    Example: (1 2 3 0 1 2 3), 0 -> (3 2 1 0 1 2 3)

✅ 3.5

    Write a function called "reverse-between", which reverses segments of a list between specified atoms.
    Examples: (1 2 3 0 1 2 3 0 1 2 3), 0 -> (3 2 1 0 3 2 1 0 3 2 1)
              (1 2 3 4), 0 -> (4 3 2 1)
✅ 3.6 (Optional)

    Write a function called "reverse-after", which reverses a part of the a list only after specified atoms.
    Example: (1 2 3 а 1 2 3), а -> (1 2 3 а 3 2 1)

✅ 3.7 (Optional)

    Make "reverse" take stop function as parameter.
    Make function "reverse-general" which combines functions from tasks 3.1, 3.2, 3.3 and 3.4.
