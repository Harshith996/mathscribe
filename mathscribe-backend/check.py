import wolframalpha
import os
import sys

equation1 = sys.argv[1]
equation2 = sys.argv[2]

API_KEY = os.environ.get('WOLF_API_KEY')
client = wolframalpha.Client("5PPWUX-GEP9JQ5VG7")

# Define the two equations to compare
# equation1 = "x^2 + 2x + 1"
# equation2 = "(x+1)^2"

# equation1 = "(x+1)^2"
# equation2 = "2 * x"

# Send the query to Wolfram Alpha and get the results
res1 = client.query(equation1)
res2 = client.query(equation2)

# Extract the plaintext results from the results
result1 = next(res1.results).text
result2 = next(res2.results).text

# Compare the results to see if they match
if result1 == result2:
    print("The two equations are equal.")
else:
    print("The two equations are not equal.")
