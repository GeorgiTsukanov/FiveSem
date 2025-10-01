from random import shuffle

class Deck:
    class Card:
        suits = ['♠', '♣', '♥', '♦']
        values = ['A', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
        colors = ["black", "black", "red", "red"]
    
        def __init__(self, value, suit):
            self.value = value
            self.suit = self.suits[suit]
            self.color = self.colors[suit]
            
        def __repr__(self):
            return f"{self.values[self.value]}{self.suit}"
        
        def __lt__(self, other):
            if type(other).__name__ != 'Card':
                raise TypeError(f"Ожидался Card, получен {type(other).__name__}")
            return self.value < other.value

        def __gt__(self, other):
            if type(other).__name__ != 'Card':
                raise TypeError(f"Ожидался Card, получен {type(other).__name__}")
            return self.value > other.value

        def __eq__(self, other):
            if not isinstance(other, str):
                raise TypeError(f"Ожидался str, получен {type(other).__name__}")
            if other in self.suits:
                return self.suit == other
            elif other in self.colors:
                return self.color == other
            else:
                raise ValueError(f"Ожидались другие значения, получен {other}")

    def __init__(self, shuf=False):
        self.deck = [self.Card(value, suit) for value in range(9) for suit in range(4)]
        if shuf:
            shuffle(self.deck)

    def __len__(self):
        return len(self.deck)

    def pop(self):
        return self.deck.pop()








    
def sortik(arr):
    m = arr.copy()
    n = len(m)
    swap = True
    if n > 1:
        while (swap):
            i = 0
            swap = False
            while i<n-1:
                if m[i]>m[i+1]:
                    m[i],m[i+1] = m[i+1], m[i]
                    swap = True
                i += 1
    return m


def one():
    m = Deck(shuf = True)
    m1 = []
    m2 = []
    while len(m) != 0:
        k = m.pop()
        if (k == "♥" or k == "♦"):
            m1.append(k)
        else:
            m2.append(k)
    m1 = sortik(m1)
    m2 = sortik(m2)
    print(m1)
    print(m2)
    
def two():
    m = Deck(shuf = True)
    m1 = []
    m2 = []
    m3 = []
    m4 = []
    while len(m) != 0:
        k = m.pop()
        if k == "black":
            if k == "♣":
                m2.append(k)
            else:
                m1.append(k)
        else:
            if k == "♦":
                m4.append(k)
            else:
                m3.append(k)
    m1 = sortik(m1)
    m2 = sortik(m2)
    m3 = sortik(m3)
    m4 = sortik(m4)
    print(m1)
    print(m2)
    print(m3)
    print(m4)

if __name__ == "__main__":
    one()
#https://docs.google.com/document/d/1kdeHYMHeIq0KFD-h1pcYjpa-zi8qe4s8/edit?usp=drivesdk&ouid=105495791874067980285&rtpof=true&sd=true




