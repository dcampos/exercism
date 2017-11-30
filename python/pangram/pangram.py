from string import ascii_lowercase

def is_pangram(sentence):
    distinct = set([l for l in sentence.lower() if l.isalpha()])
    return len(distinct) == len(ascii_lowercase)
