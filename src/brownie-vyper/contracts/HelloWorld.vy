# Hello World Smart Contract implementation

greeter: public(address)
greetings: public(String[100])

@external
def __init__():
    self.greetings = "Hello, world!"

@external
@payable
def greet(_greetings: String[100]):
    self.greetings = _greetings
    self.greeter = msg.sender
