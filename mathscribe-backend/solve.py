import wolframalpha
import os


API_KEY = os.getenv('WOLF_API_KEY')
client = wolframalpha.Client(API_KEY)

# Define the math problem you want to solve
# problem = "integrate x^2 + 3x step-by-step"
# problem = "limit sin(x)/x x->0 step-by-step"
# problem = "solve 3+5 step-by-step"

#Give the prompt to the "problem" variable like above examples


# Query the API for the solution
res = client.query(problem, podstate='Step-by-step solution')


solution = ""
keywords_solutions = ["Results", "Solutions", "Limit","Indefinite integrals", "Definite integrals"]

for pod in res.pod:
    if pod.title in keywords_solutions:
        for subpod in pod.subpods:
            if subpod.plaintext:
                solution += subpod.plaintext + "\n"

    
print(solution)






