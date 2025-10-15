# calculator.py
def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

def multiply(a, b):
    return a * b

# Optional interactive main
if __name__ == "__main__":
    print("===== Simple Calculator =====")
    try:
        num1 = float(input("Enter first number: "))
        num2 = float(input("Enter second number: "))
        print(f"Sum: {add(num1, num2)}")
        print(f"Product: {multiply(num1, num2)}")
        print(f"Difference: {subtract(num1, num2)}")
    except Exception as e:
        print("Error:", e)
