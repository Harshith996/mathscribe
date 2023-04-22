import wolframalpha
import matplotlib.pyplot as plt
from io import BytesIO
import requests
from PIL import Image
import os

API_KEY = os.getenv('WOLF_API_KEY')
client = wolframalpha.Client(API_KEY)

function = "x^3 + 3x^2"

res = client.query(f"plot {function}")
#print(res)

for pod in res.pod:
    if pod.title == "Plots":
        image_url = (pod.subpod[0].img.src)


response = requests.get(image_url)
img = Image.open(BytesIO(response.content))
img = img.convert('RGBA')
background = Image.new('RGBA', img.size, (255, 255, 255))
alpha_composite = Image.alpha_composite(background, img)
img = alpha_composite.convert('RGB')

plt.imshow(img)
plt.axis('off')
plt.title(f"Graph of {function}")
plt.show()