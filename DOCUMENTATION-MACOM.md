# MASON DOCUMENTATION

## Actual version : 2.0.0 at jul, 25 2026

# Page Styles

Para cada loja maçônica, simbólica ou altos graus, que tenha um cabeçalho e rodapé definido, foi criado um `pagestyle`.

Para facilitar a chamada de uma determinada `pagestyle` foram definidas opções de declaração da classe `freemasonry.sty`, a saber:

* `arlsap` -- Loja Simbólica "Apóstolos Paulistas"

* `arlsdjf` -- Loja Simbólica "Danylo José Fernandes"

* `sccrcrb` -- Capítulo "Ricardo Bloise"

* `kadoshjc` -- Kadosch "José Caccáos"

* `consistorio` -- Consistório "Pitágoras"

* `preceptorio` -- Preceptório de Cavaleiros Templários "São Paulo de Piratininga"

Adicionada a esta opção de definição do Corpo Maçônico foi criado a opção de declaração `timbre`. sendo esta um opção que quando declarado exibirá no cabeçalho o timbro ou logotipo do corpo, caso contrário, ou seja, não seja declarado o timbre não será exibido.

# Function

## \TheMasonicTreatmentPronoun[#1]{#2}

O primeiro parâmetro define "[s]ingular" ou "[p]lural".

O segundo parâmetro usa o número do grau para definir o pronome de tratamento maçônico.

``\TheMasonicTreatmentPronoun{s}{3}``

``Venerável Irmão``

``\TheMasonicTreatmentPronoun{p}{14}``

``Respeitáveis Irmãos``

## \TheDegreeAcronyms#1

O parâmetro de input é o Grau o qual retornará a sua respectiva Sigla

`\TheDegreeAcronyms{1}`

`A.M.`


`\TheDegreeAcronyms{2}`

`C.M.`


`\TheDegreeAcronyms{3}` ou `\TheDegreeAcronyms{M}`

`M.M.`


`\TheDegreeAcronyms{4}` até `\TheDegreeAcronyms{33}`

Retornará o próprio número informado.

## \TheREAADegreeFullName#1

O parâmetro de input é o Grau o qual retornará o nome (ou descrição).

``\TheREAADegreeFullName{4}``

`Mestre Secreto`

## \Ir[#1]{#2}

Os parâmetros de input são:

* o Grau do Irmão

* o Código do Irmão definido no acrônimo.

``\Ir[13]{555}``

``Respeitável Irmão Fulano de Tal, 13``

## \Ir*[#1]{#2}

Os parâmetros de input são:

* o Grau do Irmão

* o Texto literal a ser apresentado.

``\Ir[18]{Outro Irmão}``

``Respeitável Irmão Outro Irmão, 18``

## \IIr[#1]{#2}

Os parâmetros de input são:

* o Grau dos Irmãos

* uma lista de  Códigos dos Irmãos, definido no acrônimo, separados por vírgula.

``\IIr[30]{555,333}``

``Mui Respeitáveis Irmãos Fulano de Tal 30 e Enrolando Relo 30``
