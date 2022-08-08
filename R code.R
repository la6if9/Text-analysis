load("novels.Rdata")
xtabs(~ title + author, novels)

novels <- novels %>%  mutate(title    = gsub("The | and | of |: An Autobiography| ", "", title),
         # removing words and spaces from the titles 
         title    = abbreviate(title, 10, F),
         # abbreviating the title to the 1st 10 characters
         author   = abbreviate(author, 2),
         # abbreviating the author's' names to the 1st letters of the surname and name          
         authnov  = paste(author, title, sep= "_")) %>% 
  # putting author and title together 
  
  select(authnov, text)

wordfreq <- novels %>% 
  
  unnest_tokens(word, text) %>%           # one row per word per authcov
  
  mutate(word = gsub("_", "", word)) %>%  # removes underscores around words
  
  group_by(authnov, word) %>%             # groups the data
  
  summarize(freq = n(), .groups = "keep") # counts the number of appearances 

wordfreq <- wordfreq %>% 
  
  group_by(authnov) %>% 
  
  mutate(total   = sum(freq),
         
         relfreq = freq / total) %>% 
  
  select(-freq, -total)

stopwords <- data.frame(word = c("a", "the", "of", "and", "to", "in", 
                                 "for", "have", "i", "you", "she"))

stopfreq <- wordfreq %>% 
  
  semi_join(., stopwords, by = "word")

words <- tidyr::pivot_wider(stopfreq, names_from = word, values_from = relfreq) %>% 
  
  tibble::column_to_rownames('authnov')

pca <- prcomp(words, scale. = TRUE)

screeplot(pca)

biplot(pca, cex = .8)
