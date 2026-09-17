# Transcriptomics Notebook

**Course**: Intro Ecological Genomics - Fall 2026

**Name**: Michael O'Connor

------------------------------------------------------------------------

## 9.15.2026 - Setting up lab notebook and learning markdown

-   Setting up transcriptomics notebook

-   Learn how to take notes in markdown

-   push notes to github

**Working Directory:**

`/gpfs1/home/m/b/mboconno/Projects/eco_genomics_2026/transcriptomics`

**Input Files**:

`none`

**Output Files**:

`/gpfs1/home/m/b/mboconno/Projects/eco_genomics_2026/transcriptomics/Transcriptomics.notebook.md`

**Programs and dependencies**:

-   `R Version 4.5.1`

-   `R-Studio`

**Scripts**:

`none`

**Code**:

``` r
Print ("Hello World")
```

**Table:**

| Col1 | Col2 | Col3 |
|------|------|------|
|      |      |      |
|      |      |      |
|      |      |      |
|      |      |      |

![](images/markdown-syntax-cheatsheet.webp)

**Notes/Observation**:

-   Graph stuff

**Next Steps?**

------------------------------------------------------------------------

# Transcriptomics Notebook

**Course**: Intro Ecological Genomics - Fall 2026

**Name**: Michael O'Connor

------------------------------------------------------------------------

## 9.17.2026 - Diving into code

-   learned zcat

-   used vacc shell to check out data
  

**Working Directory:**

`/gpfs1/home/m/b/mboconno/Projects/eco_genomics_2026/transcriptomics`

**Input Files**:

`/gpfs1/cl/biol3990`

**Output Files**:

`/gpfs1/home/m/b/mboconno/Projects/eco_genomics_2026/transcriptomics/Transcriptomics.notebook.md`

**Programs and dependencies**:

-   `R Version 4.5.1`

-   `R-Studio`

-   Vacc Shell

**Scripts**:

`zcat AA_F0_Rep3_2_clean.fq.gz | head -n 8`

**Code**:

``` [mboconno@vacc-login1 mboconno]$ cd /gpfs1/cl/biol3990
[mboconno@vacc-login1 biol3990]$ pwd
/gpfs1/cl/biol3990
[mboconno@vacc-login1 biol3990]$ ll
total 1
drwxrwsr-x 5 mpespeni biol3990 4096 Sep 15 11:42 Transcriptomics
[mboconno@vacc-login1 biol3990]$ ls
Transcriptomics
[mboconno@vacc-login1 biol3990]$ cd Transcriptomics/
[mboconno@vacc-login1 Transcriptomics]$ ll
total 3
drwxrwsr-x 2 mpespeni biol3990 4096 Sep 15 11:42 CleanData
drwxrwsr-x 2 mpespeni biol3990 4096 Sep 15 11:41 CountsMatrix
drwxrwsr-x 2 mpespeni biol3990 4096 Sep 15 11:29 RawData
[mboconno@vacc-login1 Transcriptomics]$ cd c
-bash: cd: c: No such file or directory
[mboconno@vacc-login1 Transcriptomics]$ cd CleanData/
[mboconno@vacc-login1 CleanData]$ ll
total 9574520
-rw-r--r-- 1 mpespeni biol3990 1443367162 Sep 15 11:38 AA_F0_Rep1_1_clean.fq.gz
-rw-r--r-- 1 mpespeni biol3990 1466551500 Sep 15 11:38 AA_F0_Rep1_2_clean.fq.gz
-rw-r--r-- 1 mpespeni biol3990 1747188307 Sep 15 11:38 AA_F0_Rep2_1_clean.fq.gz
-rw-r--r-- 1 mpespeni biol3990 1780157475 Sep 15 11:38 AA_F0_Rep2_2_clean.fq.gz
-rw-r--r-- 1 mpespeni biol3990 1659953125 Sep 15 11:38 AA_F0_Rep3_1_clean.fq.gz
-rw-r--r-- 1 mpespeni biol3990 1707066880 Sep 15 11:38 AA_F0_Rep3_2_clean.fq.gz
[mboconno@vacc-login1 CleanData]$ zcat AA_F0_Rep
AA_F0_Rep1_1_clean.fq.gz  AA_F0_Rep1_2_clean.fq.gz  AA_F0_Rep2_1_clean.fq.gz  AA_F0_Rep2_2_clean.fq.gz  AA_F0_Rep3_1_clean.fq.gz  AA_F0_Rep3_2_clean.fq.gz
[mboconno@vacc-login1 CleanData]$ zcat AA_F0_Rep3_
AA_F0_Rep3_1_clean.fq.gz  AA_F0_Rep3_2_clean.fq.gz  
[mboconno@vacc-login1 CleanData]$ zcat AA_F0_Rep3_2_clean.fq.gz | head -n 8
@A00742:278:HH5VYDSX2:2:1101:3965:1000 2:N:0:CTCGTGTA+NTAGGCTT
TGGCAGATAGAGAAGAAGGGAAGGAGTACACCATTGAACACCTGTGCTATCAGAATAACAGTTGTTCTTTCATCTACACCAATTAAGGAGTTAACAAAAGCTGCAACAATGACCATAACAACCATTATTGCCATGTAAATCCACCGCGGC
+
FFFFFFF:FFFFFFFFFFFFF,FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF:FFF,FFFFFF:FFFFF:FFFFFFFFFFFFFFFFFF:FFFFFFF
@A00742:278:HH5VYDSX2:2:1101:11614:1000 2:N:0:CTCGTGTA+NTAGGCTT
ATTTTAGAAACCAATAAAAGTTTTTCTTCTTCACTAAAAGAGGTTGCTGTCCAAGGATTAGGTTCACTACCAACTTTCATAGCTTTCAGCTTATCAGATTCAAAAAAAGCATCCGGAGGAAAGTGATCACTACAGAGTCTGGAGTTGATG
+
FF:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF:FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF:FFFFFFFFFFFFFFF:FFFFFFFFF,FFFFFFFFFFF:,FFFF,F:FFFFFFFFFFFFFFFFFFFF,FFFFFFFF
[mboconno@vacc-login1 CleanData]$ zcat AA_F0_Rep3_2_clean.fq.gz | head -n 4
@A00742:278:HH5VYDSX2:2:1101:3965:1000 2:N:0:CTCGTGTA+NTAGGCTT
TGGCAGATAGAGAAGAAGGGAAGGAGTACACCATTGAACACCTGTGCTATCAGAATAACAGTTGTTCTTTCATCTACACCAATTAAGGAGTTAACAAAAGCTGCAACAATGACCATAACAACCATTATTGCCATGTAAATCCACCGCGGC
+
FFFFFFF:FFFFFFFFFFFFF,FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF:FFF,FFFFFF:FFFFF:FFFFFFFFFFFFFFFFFF:FFFFFFF
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ 
[mboconno@vacc-login1 CleanData]$ zcat AA_F0_Rep3_2_clean.fq.gz | WC - l
-bash: WC: command not found
[mboconno@vacc-login1 CleanData]$ zcat AA_F0_Rep3_2_clean.fq.gz | wc - l
93638040 117047550 8504182762 -
wc: l: No such file or directory
93638040 117047550 8504182762 total
[mboconno@vacc-login1 CleanData]$ 
```
