# FREEMASONRY Class Documentation

## Actual version : 1.0.0 at jan, 27 2025

## How to use

The $\TeX$ file will have the following minimum configuration:

```
01. \documentclass[12pt,onehalfspacing,kadosch,timbre]{freemasonry}%

02. \graphicspath{{~/Macom/Source/images}}%

03. \begin{document}%

04.    <input here your document tex.>

05. \end{document}%
```

On line 01 the options in brackets reported below:

### 1st Option

The Font size : [ 10pt, 11pt, 12pt ]

### 2nd Option

The line spacing : [ singlespacing, onehalfspacing, doublespace ]

### 3rd Option

Header and footer defines : [ arlsap, arlsdjf, sccrcrb, kadoshjc, consistorio ]

### 4th Option

Conditional to add or not the logo in the header : [ timbre ]

On line 02, the declaration of the *`graphicspath`* command is mandatory.

## Page Styles


Para cada loja maçônica, simbólica ou altos graus, que tenha um cabeçalho e rodapé definido, foi criado um `pagestyle`.

Para facilitar a chamada de uma determinada `pagestyle` foram definidas opções de declaração da classe `freemasonry.cls`, a saber:

* `arlsap` -- Loja Simbólica "Apóstolos Paulistas"

* `arlsdjf` -- Loja Simbólica "Danylo José Fernandes"

* `sccrcrb` -- Capítulo "Ricardo Bloise"

* `kadoshjc` -- Kadosch "José Caccáos"

* `consistorio` -- Consistório "Pitágoras"

Adicionada a esta opção de definição do Corpo Maçônico foi criado a opção de declaração `timbre`. sendo esta um opção que quando declarado exibirá no cabeçalho o timbro ou logotipo do corpo, caso contrário, ou seja, não seja declarado o timbre não será exibido.

# Definições não maçônicas

Agora teremos uma definição para dia, mês e ano de modo a facilitar e centralizar construções de data

```
\def\dia{}%
\def\mes{}%
\def\ano{}%
```

Em composição as definições acima teremos agora `\nomeMes` e `\diaCardinal`:

O `\nomeMes` escreverá o nome completo do mês atribuído na definição `\mes`, assim como, o `\diaCardinal` escreverá os números cardinais que estiverem atribuídos nadefinição `\dia`. **Observação** deverão ser informados somente os números válidos para um dia, ou seja, valores entre '1' (um) e '31' (trinta e um), assim como, para o mês os valores entre '1' (um) e '12' (doze).

por exemplo:

```
\def\dia{12}%
\def\mes{1}%
\diaCardinal ~-~ \nomeMes
```

```
doze - janeiro
```

## \aspas{#1}, \aspassimples{#1}, \italico{#1}, \negrito{#1} e \sublinhado{#1}

As seguintes definições são auto-explicativas:

`\aspas{#1}`, `\aspassimples{#1}`, `\italico{#1}`, `\negrito{#1}` e `\sublinhado{#1}`.

\aspas{teste}               -> "teste"

\aspassimples{outro teste}  -> 'outro teste'

\italico{testando!!!}       -> *testando!!!*

\negrito{testando!!!}       -> **testando!!!**

\sublinhado{testando!!!}    -> <ins>testando!!!</ins>


## \citação{#1}{#2} e \begin{citdao} ... \end{citado}

As definições `\citação{#1}{#2}` e `\begin{citdao} ... \end{citado}` serão responsáveis por criar um texto no formato de citação. Avançado em 4cm da marge esquerda e com sua fonte reduzida para 10pt.

## \TheJob#1, \Titulo{#1} e \Secao{#1}

As definições `\Titulo{#1}` e `\Secao{#1}` foram criadas para simplicar o uso de um padrão para definir como o Título  e/ou Capítulo de um texto está formatado, assim como, uma Seção e/ou sub-capítulo.

## \TheHebrewWord

`\TheHebrewWord[#1]{#2}` com o auxílio da biblioteca `cjhebrew` é facilitada a escrita de palavras ou sentenças em hebraíco.

### 1st option: Font size

No primeiro paramêtro (opcional) pode ser alterado o tamanho padrão da fonte especificamente para a escrita em hebraíco, não será extendido para o restante do texto, de modo que, caso seja especificado um valor para o tamanho da fonte, este será utilizado, caso contrário será usado o tamanho no início do documento.

### 2nd option: word, phrase or paragraph

Utilizando os caracteres para conversão informados na documentação do `cjhebrew`;

## \LetterExpander

Esta definição em estágio de desenvolvimento deve receber duas opições, sendo:

### 1st option: distance between letters

### 2nd option: word or string

```
\LetterExpander[6]{Teste}
...
T e s t e
...
\LetterExpander[12]{teste}
...
T  e  s  t  e
...
```

# Definições maçônicas

## \SM#1

O único parâmetro que esta definição recebe é a própria sigla maçônica a ser impressa.

**OBSERVAÇÃO :** a sigla deve usar o caracter '.' para indicar onde ficará os três pontos maçônicos.

```
\SM{Ven.M.} é o \SM{Ir.} ...
...
Ven$\therefore$M$\therefore$ é o Ir$\therefore$ ...
```

## \TheMasonicTreatmentPronoun[#1]{#2}

O primeiro parâmetro define "[s]ingular" ou "[p]lural".

O segundo parâmetro usa o número do grau para definir o pronome de tratamento maçônico.

``\TheMasonicTreatmentPronoun{s}{3}``

``Venerável Irmão``

``\TheMasonicTreatmentPronoun{p}{14}``

``Respeitáveis Irmãos``

## \TheREAADegreeFullName#1

O parâmetro de input é o Grau o qual retornará o nome (ou descrição).

``\TheREAADegreeFullName{4}``

`Mestre Secreto`

## \Ir[#1]{#2} e \Ir*[#1]{#2}

### Os parâmetros de input são:

* o Grau do Irmão

* o Código do Irmão definido no acrônimo.

``\IrFil[13]{555}``

``Respeitável Irmão Fulano de Tal 13``

### A segunda definição deverá ser usada quando não existe um acronimo definido.

``\IrFil[2]{QQ Coisa que digitar aqui escreverá lá}``

``Irmão QQ Coisa que digitar aqui escreverá lá, C.M.``



## \IIr[#1]{#2}

Os parâmetros de input são:

* o Grau dos Irmãos

* uma lista de  Códigos dos Irmãos, definido no acrônimo, separados por vírgula.

``\IIr[30]{555,333}``

``Mui Respeitáveis Irmãos Fulano de Tal 30 e Enrolando Relo 30``
