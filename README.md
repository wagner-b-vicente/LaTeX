# My LaTeX !

My repository to keep my files **$\TeX$**.

# Packages

All packages that I need to edit my **$\LaTeX$** environment.

##  ABNTeX2

Standards for formatting academic documents. See the page [$ABNTeX_2$](https://www.abntex.net.br/ "ABNTeX")

> `# cd /usr/share/texmf`
> `# tar xzf /home/wagner/GitHub/LaTeX/abntex2.tds-1.9.7.tar.gz`

## Normal

Development to assist with $\LaTeX$ documents.

>`# cd /usr/share/texmf/tex/latex`
>`# ln -s /home/wagner/GitHub/LaTeX/normal`

## Macom

Structure for the works of the Masonic Lodge.

>`# cd /usr/share/texmf/tex/latex`
>`# ln -s /home/wagner/GitHub/LaTeX/macom`

## XString

Routines for *strings* treatments inside **$\LaTeX$**.

> `# cd /usr/share/texmf/tex/latex`
> `# ln -s /home/wagner/GitHub/LaTeX/xstring`

## Suffix / Bigfoot

Tools to improve Acronym.

## DraftWaterMark

Create Water Mark in **$\LaTeX$** environment.

## CJHebrew

Responsible for printing Hebrew characters.

> `# cp -r cjhebres/* /usr/share/texmf`

Check if necessary to install the package `oberdiek`.

> `# upmap-sys --enable Map=cjhebrew.map`

# Updates

It is necessary to execute the command below, after any update of the $\LaTeX$ environment.

> `# texhash`

# Install extras fonts

## Fonts Initials

[$\LaTeX$ Fonts Initials](https://tug.org/FontCatalogue/otherfonts.html "Fonts Initials")

### Directory structure

> `# cd /usr/share/texmf`


tex-local
```
 \-> /tex/latex => criar tug/initials (manter os arquivos *.FD)
 ...
 \-> /fonts
	\-> afm		\			              /	*.AFM
	\-> map		 \			             /	*.MAP
                  > criar tug/initials	<
	\-> tfm		 /			             \	*.TFM
	\-> type1	/			              \	*.PFB
```

Step 00.
mkdir /tmp/font.latex ; cd /tmp/font.latex ; unzip ~/Downloads/initials.zip

Step 01.
> `# cd /usr/share/texmf`

Step 02.
>`# mkdir -p tex/latex/tug/initials fonts/{afm,map,tfm,type1}/tug/initials`

Step 03.
> `# cd tex/latex/tug/initials/`

Step 04.
> `# mv /tmp/font.latex/initials/*.fd .`

Step 05.
> `# mv /tmp/font.latex/initials/config.* .`

Step 06.
> `# cd ../../../../fonts/afm/tug/initials/`

Step 07.
> `# mv /tmp/font.latex/initials/*.afm .`

Step 08.
> `# cd ../../../map/tug/initials/`

Step 09.
> `# mv /tmp/font.latex/initials/*.map .`

Step 10.
> `# cd ../../../tfm/tug/initials/`

Step 11.
> `# mv /tmp/font.latex/initials/*.tfm .`

Step 12.
> `# cd ../../../type1/tug/initials/`

Step 11.
> `# mv /tmp/font.latex/initials/*.pfb .`

Step 12.
> `# updmap-sys --enable Map=RoyalIn.map`