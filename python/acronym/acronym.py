import re

def abbreviate(words):
    letters = re.findall('(\w)\w*', words)
    return ''.join(letters).upper()
