
def debug(message):
    with open("results.txt","a") as f:
        f.write(f"{message}\n")