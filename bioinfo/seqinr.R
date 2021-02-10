# Load seqinr package 
library(seqinr)

# Reading Data: FASTA 
cov <- read.fasta("covid19.fasta")
seq1 <- cov[[1]]
length(seq1)

ebola <- read.fasta("ebola.fasta")
seq2 <- ebola[[1]]
length(seq2)

sars <- read.fasta("sars.fasta")
seq3 <- sars[[1]]
length(seq3)



mers <- read.fasta("mers.fasta")
seq4 <- mers[[1]]
length(seq4)

# NT Frequency 
table(seq1)
prop.table(table(seq1))


# Exploration: Length 
den <- read.fasta("den1.fasta")
seq <- den[[1]]
# Length 
length(seq)
# Frequency 
table(seq)

# Percentage 
prop.table(table(seq))
prop.table(table(seq)) * 100

# Barplot 
barplot(table(seq))
barplot(table(seq), main = "Distribution of Nucleotide")
barplot(table(seq), main = "Distribution of Nucleotide", 
        xlab = "Bases", ylab = "Nucleotide Frequency")

barplot(table(seq), main = "Distribution of Nucleotide", 
        xlab = "Bases", ylab = "Nucleotide Frequency", 
        col=2)


barplot(table(seq), main = "Distribution of Nucleotide", 
        xlab = "Bases", ylab = "Nucleotide Frequency", 
        col="aquamarine4")

# DNA Words / K-mer Analysis 
count(seq, 2)
count(seq, 3)

# Calculate GC 
GC(seq)
GC(seq) * 100

# Sliding window analysis 
GC(seq[1:2000])
GC(seq[2001:4000])
GC(seq[4001:6000])
GC(seq[6001:8000])
GC(seq[8001:10000])


# Dotplot
dotPlot(seq[1:2000], seq[4000:8000])


# Introduction to Bioconductor 
# Load Biostrings 
library(Biostrings)
# DNA Letters 
DNA_BASES

# RNA Letters 
RNA_BASES

# Amino Acids(AA)
AA_STANDARD

# DNA Alphabets 
DNA_ALPHABET

# RNA Alphabets 
RNA_ALPHABET

# Amino Acids Alphabets 
AA_ALPHABET

# Transcription 
dna_seq <- DNAString("ATTGGGCCGGGTTAAAT")
dna_seq

# RNA Strings 
rna_seq <- RNAString(dna_seq)
rna_seq


# RNA to AA 
aa_seq <- translate(rna_seq)
aa_seq

# Shortcut Translation 
aa_seq2 <- translate(dna_seq)
aa_seq2


# Complement 
complement(dna_seq)
complement(rna_seq)

# Rev 
rev(dna_seq)
rev(rna_seq)

# Reverse 
reverse(dna_seq)
reverse(rna_seq)

# Reverse Complement 
reverseComplement(dna_seq)
reverse(complement(dna_seq))


# Creatung String Set 
covid19 <- readDNAStringSet("covid19.fasta")
length(covid19)
width(covid19)

# Collect sequence 
covid19_seq <- unlist(covid19)
length(covid19_seq)

# Single to Set 
single_seq <- DNAStringSet(covid19_seq, 
                        start = c(1, 101, 201), 
                        end = c(100, 200, 300))
single_seq


# Pair-wise alignment 
sigma <- nucleotideSubstitutionMatrix(match = 2, 
                                      mismatch = -1, 
                                      baseOnly = TRUE)
sigma


s1 <- "GAATTC"
s2 <- "GATTA"


alignment <- pairwiseAlignment(s1, s2,
                  substitutionMatrix = sigma, 
                  gapOpening = -2,
                  gapExtension = -8, 
                  scoreOnly = FALSE)

alignment


# Load Genome 
library(BSgenome)
library(BSgenome.Scerevisiae.UCSC.sacCer3)
yeast <- BSgenome.Scerevisiae.UCSC.sacCer3

# Type 
class(yeast)
# Length
length(yeast)
# Names 
names(yeast)
# Access 
yeast$chrI
# seqinfo 
seqinfo(yeast)
# seqlevels 
seqlevels(yeast)
# seqlengths 
seqlengths(yeast)
# seqnames 
seqnames(yeast)
# seqlevelstyle 
seqlevelsStyle(yeast)

# Exploratory Data Analysis 
summary(yeast)