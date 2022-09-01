# guessing_game.py
"""guessing_game.py

Guess the number between 1 and 10.
"""
import random
CHOICE = random.randint(1,10)

def test_guess(guess):
    """Decide if the guess is correct and print a message.
    """
    if (guess < CHOICE):
        print("  Sorry, your guess is too low")
        return False
    elif (guess > CHOICE):
        print("  Sorry, your guess is too high")
        return False
    print("  You are right!")
    return True

flag = False
while (not flag):
    guess = int(input("Guess an integer between 1 and 10: "))
    flag = test_guess(guess)
