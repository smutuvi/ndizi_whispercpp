print("start generating wordcloud")

from wordcloud import WordCloud

# Define the input file path
input_file = "txt_output/transcribed_text.txt"

# Read the contents of the file
with open(input_file, "r") as file:
    text_data = file.read()

# Generate the word cloud
# wordcloud = WordCloud().generate(text_data)

wordcloud = WordCloud(width = 1800, height = 1200,
                background_color ='white',
                min_font_size = 10).generate(text_data)

# Display the word cloud
import matplotlib.pyplot as plt
plt.imshow(wordcloud, interpolation='bilinear')
plt.axis("off")
plt.show()