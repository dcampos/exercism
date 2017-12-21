def distance(a, b):
    if len(a) != len(b):
        raise ValueError('Strands must be equally sized.')

    return sum([a[i] != b[i] for i in range(len(a))])
