# library yang digunakan
library(tidyverse)
library(GGally)
library(FactoMineR)
library(factoextra)
# read data dan lihat struktur data
wholesale <- read.csv("C:/Users/asus/Documents/UAS Data Mining/Wholesale.csv")
glimpse(wholesale)
# lihat data
head(wholesale)
# ubah tipe data 
wholesale <- wholesale %>%
  mutate(Channel = factor(Channel, levels = c(1,2),
                          labels = c("Horeca", "Retail"))) %>% 
  mutate(Region = as.factor(Region)) %>% 
  mutate_if(is.integer, as.numeric)
# cek missing value
colSums(is.na(wholesale))

#Principal Component Analysis (PCA)
#Create PCA
# index kolom numerik
quantivar <- c(3:8) # kolom 3, 4, 5, 6, 7, dan 8
# index kolom kategorik
qualivar <- c(1:2)
pca_wholesale <- PCA(X = wholesale, # data
                     scale.unit = T, # data di-scale terlebih dahulu
                     quali.sup = qualivar, # index kolom kategorik di data
                     graph = T, # agar tidak dibuatkan plot, pembuatan plot di plot.PCA() saja
                     ncp = 6) # jumlah PC yang dihasilkan secara default = 5
plot.PCA(pca_wholesale, # objek hasil PCA 
         choix = "ind", # plot individual (observasi)
         select = "contrib5", # menampilkan index 5 observasi outlier terluar
         habillage = 1, # mewarnai titik-titik amatan berdasarkan kolom kategorik
         invisible = "quali") # menghilangkan label kolom kategori (mengganggu visual)
plot.PCA(pca_wholesale, 
         choix = "var") # plot variable
# summary pca
pca_wholesale$eig
# dimdisc: dimension description
# secara default hanya menampilkan kontribusi dari PC1-PC3
dim <- dimdesc(pca_wholesale)
# kontribusi setiap variabel terhadap PC1
# quanti: variable numerik
dim$Dim.1$quanti
# hasil pca
dim(pca_wholesale$ind$coord)

#K-Means Clustering
# read data
head(wholesale)
#Optimum K
# buang variabel yang tidak digunakan
wholesale <- wholesale %>% 
  select(-c(Channel, Region))
wholesale_scale <- prcomp(wholesale, scale. = T)
RNGkind(sample.kind = "Rounding")
kmeansTunning <- function(wholesale, maxK = 6) {
  withinall <- NULL
  total_k <- NULL
  for (i in 2:maxK) {
    set.seed(101)
    temp <- kmeans(wholesale,i)$tot.withinss
    withinall <- append(withinall, temp)
    total_k <- append(total_k,i)
  }
  plot(x = total_k, y = withinall, type = "o", xlab = "Number of Cluster", ylab = "Total within")
}
kmeansTunning(wholesale, maxK = 6)
#Building Cluster
# your code here
set.seed(101)
wholesale_cluster <- kmeans(x = wholesale, centers = 6)
library(factoextra)
fviz_cluster(object = wholesale_cluster, data = wholesale)
wholesale_new <- wholesale %>%
  mutate(cluster = wholesale_cluster$cluster)
head(wholesale_new)
profil <- wholesale_new %>% 
  group_by(cluster) %>% 
  summarise_all(mean)
head(profil)
profil %>% 
  pivot_longer(cols = -cluster, names_to = "type", values_to = "value") %>% 
  ggplot(aes(x = factor(cluster), y = value)) +
  geom_col(aes(fill = cluster)) +
  facet_wrap(~type)
