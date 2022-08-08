# Text-analysis

PCA method to analyze word frequencies of ten stopwords in novels by the three Brönthe sisters and Jane Austin.

1. The raw data needs to be converted into a data frame with the author/title in the rows, and the stopwords as variables in the columns to make it suitable for PCA.
2. Replace author and title by the compound variable authnov
3. Make a data frame wordfreq with the frequency of words appearing within each category of authnov
4. Make a data frame stopwords with the variable word containing the strings “a”, “the”, “of”, “and”, “to”, “in”, “for”, “have”, “you”, and “she”.
5. Deselect all words form wordfreq that are not in stopwords, and save a stopfreq
6. Transform wordfreq into a data frame words with the variable authnov in the rows, and the stopwords as variables in the columns

![](https://github.com/la6if9/Text-analysis/blob/main/Rplot.png)
![](https://github.com/la6if9/Text-analysis/blob/main/Rplot01.png)
