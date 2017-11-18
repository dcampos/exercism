def is_isogram(string):
    return len(''.join(c for c in set(sorted(string.lower())) \
        if c.isalpha())) == len(string.replace('-', '').replace(' ', ''))