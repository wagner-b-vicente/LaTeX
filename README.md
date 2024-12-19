# My LaTeX !

## Actual version : 1.0.0 at nov, 4 2022

My repository to keep my files $\TeX$.

# Packages

All packages that I need to edit my $\LaTeX$ environment.

## Installation non default packages

> `# sudo zypper in texlive-acronym`
>
> `# sudo zypper in texlive-cjhebrew`
>
> `# sudo zypper in texlive-doublestroke`
>
> `# sudo zypper in texlive-fontsetup`
>
> `# sudo zypper in texlive-fontsize`

##  ABNTeX2

Standards for formatting academic documents. See the page [ABNTeX_2](https://www.abntex.net.br/ "ABNTeX")

Case 1:

    There is package in Linux repository:

> `# sudo zypper se texlive-abntex`
>
> `# sudo zypper in texlive-abntex2`

Case 2:

There **is not** package in Linux repository. Follow the below instructions and download package in [ABNTeX_2](https://github.com/abntex/abntex2/wiki/Instalacao).

Or, take it package from [CTAN](https://www.ctan.org/pkg/abntex2) and execute the below commands:

> `# cd /usr/share/texmf`
>
> `# sudo tar xzf /home/wagner/LaTeX/abntex2.tds-1.9.7.tar.gz`

## Normal

Development to assist with $\LaTeX$ documents.

>`# cd /usr/share/texmf/tex/latex`
>
>`# sudo ln -s /home/wagner/GitHub/LaTeX/normal`

## Macom

Structure for the works of the Masonic Lodge.

>`# cd /usr/share/texmf/tex/latex`
>
>`# sudo ln -s /home/wagner/GitHub/LaTeX/macom`

## XString

Routines for *strings* treatments inside $\LaTeX$.

> `# cd /usr/share/texmf/tex/latex`
>
> `# sudo ln -s /home/wagner/LaTeX/xstring`

# Updates

It is necessary to execute the command below, after any update of the $\LaTeX$ environment.

> `# texhash`

# Install extras fonts

The root directory is `/usr/share/texmf`

## Fonts Initials

### Directory structure

In root directory will be create the following structure:

> `# cd /usr/share/texmf`
>
> `/usr/share/texmf #`

**Step 1:**

Will create the directory `/usr/share/texmf/tex/latex/initials` if there is not exist.

> `mkdir -p /usr/share/texmf/tex/latex/initials`

After this creation, all `<file>.MAP` will be copy there.

**Step 2:**

Will create the structure directories `/usr/share/texmf/fonts/{afm,map,tfm,type1}/initials` if there is not exist.

> `mkdir -p /usr/share/texmf/fonts/{afm,map,tfm,type1}/initials`

**Step 3:**

Download the zip file from site [$\LaTeX$ Fonts Initials](https://www.ctan.org/tex-archive/fonts/initials/ "Fonts Initials")

Uncompress the zip file in a temporary directory, for example: `/tmp/Fonts-Initials`

> `/tmp/Fonts-Initials # unzip /home/wagner/Trash/initials.zip`

**Step 4:**

Copy all `.fd` and `config.<font>` to the directory `/usr/share/texmf/tex/latex/initials`.

> `/tmp/Fonts-Initials # cp initials/*.fd /usr/share/texmf/tex/latex/initials/.`
>
> `/tmp/Fonts-Initials # cp initials/config.* /usr/share/texmf/tex/latex/initials/.`

**Step 5:**

Copy all `.afm`, `.map`, `.tfm`, and `.type1` to respective directory in `/usr/share/texmf/fonts`.

> `/tmp/Fonts-Initials # cp initials/*.afm /usr/share/texmf/fonts/afm/initials/.`
>
> `/tmp/Fonts-Initials # cp initials/*.map /usr/share/texmf/fonts/map/initials/.`
>
> `/tmp/Fonts-Initials # cp initials/*.tfm /usr/share/texmf/fonts/tfm/initials/.`
>
> `/tmp/Fonts-Initials # cp initials/*.pfb /usr/share/texmf/fonts/type1/initials/.`

**Step 6:**

Update the $\LaTeX$ environment:

> `cd /usr/share/texmf/fonts/map/initials`
>
> `for MYMAP in $(ls) ; do updmap-sys --enable Map=$MYMAP ; done`
> 
> `# texhash`

<!---
## Suffix / Bigfoot

Tools to improve Acronym.

## DraftWaterMark

Create Water Mark in **\LaTeX** environment.

## CJHebrew

Responsible for printing Hebrew characters.

> `# cp -r cjhebres/* /usr/share/texmf`

Check if necessary to install the package `oberdiek`.

> `# upmap-sys --enable Map=cjhebrew.map`
--->
