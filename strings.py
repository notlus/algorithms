def string_reverser(our_string):
    """
    Reverse the input string

    Args:
       our_string(string): String to be reversed
    Returns:
       string: The reversed string
    """

    reversed_string = ""
    for i in range(len(our_string) - 1, -1, -1):
        reversed_string += our_string[i]

    return reversed_string


# print("Pass" if ('retaw' == string_reverser('water')) else "Fail")


def anagram_checker(str1, str2):
    """
    Check if the input strings are anagrams of each other

    Args:
       str1(string),str2(string): Strings to be checked
    Returns:
       bool: Indicates whether strings are anagrams
    """

    str1 = str1.replace(" ", "").lower()
    str2 = str2.replace(" ", "").lower()

    if len(str1) != len(str2):
        return False

    if sorted(str1) != sorted(str2):
        return False

    return True

# print ("Pass" if not (anagram_checker('water','waiter')) else "Fail")
# print ("Pass" if anagram_checker('Dormitory','Dirty room') else "Fail")
# print ("Pass" if anagram_checker('Slot machines', 'Cash lost in me') else "Fail")
# print ("Pass" if not (anagram_checker('A gentleman','Elegant men')) else "Fail")
# print ("Pass" if anagram_checker('Time and tide wait for no man','Notified madman into water') else "Fail")


def word_flipper(our_string):
    """
    Flip the individual words in a sentence

    Args:
       our_string(string): String with words to flip
    Returns:
       string: String with words flipped
    """

    flipped = ""
    words = our_string.split(' ')
    for word in words:
        flipped += word[::-1] + ' '

    return flipped.strip()

# print ("Pass" if ('retaw' == word_flipper('water')) else "Fail")
# print ("Pass" if ('sihT si na elpmaxe' == word_flipper('This is an example')) else "Fail")
# print ("Pass" if ('sihT si eno llams pets rof ...' == word_flipper('This is one small step for ...')) else "Fail")


def hamming_distance(str1, str2):
    """
    Calculate the hamming distance of the two strings

    Args:
       str1(string),str2(string): Strings to be used for finding the hamming distance
    Returns:
       int: Hamming Distance
    """

    if len(str1) != len(str2):
        return None

    hamming_distance = 0
    for index in range(len(str1)):
        if str1[index] != str2[index]:
            hamming_distance += 1

    return hamming_distance


print("Pass" if (10 == hamming_distance('ACTTGACCGGG', 'GATCCGGTACA')) else "Fail")
print("Pass" if (1 == hamming_distance('shove', 'stove')) else "Fail")
print("Pass" if (None == hamming_distance(
    'Slot machines', 'Cash lost in me')) else "Fail")
print("Pass" if (9 == hamming_distance('A gentleman', 'Elegant men')) else "Fail")
print("Pass" if (2 == hamming_distance(
    '0101010100011101', '0101010100010001')) else "Fail")
