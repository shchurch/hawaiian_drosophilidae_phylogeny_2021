from itertools import product
# According to https://stackoverflow.com/a/30134039/1878788:
# The problem is solved recursively:
# If you already have a partition of n-1 elements, how do you use it to partition n elements?
# Either place the n'th element in one of the existing subsets, or add it as a new, singleton subset.
def partitions_of_set(s):
    if len(s) == 1:
        yield frozenset(s)
        return
    # Extract one element from the set
    # https://stackoverflow.com/a/43804050/1878788
    elem, *_ = s
    rest = frozenset(s - {elem})
    for partition in partitions_of_set(rest):
        for subset in partition:
            # Insert the element in the subset
            try:
                augmented_subset = frozenset(subset | frozenset({elem}))
            except TypeError:
                # subset is actually an atomic element
                augmented_subset = frozenset({subset} | frozenset({elem}))
            yield frozenset({augmented_subset}) | (partition - {subset})
        # Case with the element in its own extra subset
        yield frozenset({elem}) | partition

def print_set(f):
    if type(f) not in (set, frozenset):
        return str(f)
    return "(" + ",".join(sorted(map(print_set, f))) + ")"

def trees(leaves):
    if type(leaves) not in (set, frozenset):
        # It actually is a single leaf
        yield leaves
        # Don't try to yield any more trees
        return
    # Otherwise, we will have to consider all the possible
    # partitions of the set of leaves, and for each partition,
    # construct the possible trees for each part
    for partition in partitions_of_set(leaves):
        # We need to skip the case where the partition
        # has only one subset (the initial set itself),
        # otherwise we will try to build an infinite
        # succession of nodes with just one subtree
        if len(partition) == 1:
            part, *_ = partition
            # Just to be sure the assumption is correct
            assert part == leaves
            continue
        # We recursively apply *tree* to each part
        # and obtain the possible trees by making
        # the product of the sets of possible subtrees.
        for subtree in product(*map(trees, partition)):
            # Using a frozenset guarantees
            # that there will be no duplicates
            yield frozenset(subtree)

all_trees = frozenset(
    {frozenset({tree, "6"}) for tree in trees({"1", "2", "3", "4", "5"})})

for tree in all_trees:
    print(print_set(tree) + ";")