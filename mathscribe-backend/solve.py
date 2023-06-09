import wolframalpha
import os
import sys

func = sys.argv[1]

API_KEY = os.environ.get('WOLF_API_KEY')
client = wolframalpha.Client("5PPWUX-GEP9JQ5VG7")

#Give the prompt to the "problem" variable like above examples


# Query the API for the solution
res = client.query(func, podstate='Step-by-step solution')
# result1 = next(res.results).text   --- THIS WAY YOU CAN GET THE ANSWER ONLY

# Extract the step-by-step solution from the API response
solution = ""
keywords_solutions = ["Results", "Solutions", "Limit","Indefinite integrals", "Definite integrals"]
# Results for algebra, solutions for differentiation, Limit for limit, Indefinate integrals for integration
# print(res)
url = ""
result1 = next(res.results).text.split("=")[1][1:]   #splitttttttttttttttt
if "constant" in result1:
    result1 = result1[:-11]  #indefinate integrals can avoid the + constant to ensure graphing
for pod in res.pod:
    # print(pod.title)
    if pod.title in keywords_solutions:
        if len(pod.subpod) > 2:
            url = pod.subpod[2].img.src
        else:
            url = pod.subpod[1].img.src
        for subpod in pod.subpods:
            if subpod.plaintext:
                solution += subpod.plaintext + "\n"

    
# Print the solution
#Solution has the text form of step by step solution
# print(solution)

if url:
    print([url,result1])
else:
    print("Something failed!")



