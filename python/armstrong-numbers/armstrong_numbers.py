def is_armstrong(number):
    string_digits = str(number)
    number_of_digits = len(string_digits)
    return number == sum([int(i)**number_of_digits for i in string_digits])

