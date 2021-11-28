def staircase(n):
    # Base Case - minimum steps possible and number of ways the child can climb them
    if n == 1:
        return 1
    if n == 2:
        return 2
    if n == 3:
        return 3

    # Inductive Hypothesis - ways to climb rest of the steps
    
    # Inductive Step - use Inductive Hypothesis to formulate a solution
    return 1 + staircase(n - 1)

print(staircase(1))
print(staircase(2))
print(staircase(3))
