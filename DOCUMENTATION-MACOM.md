# MASON DOCUMENTATION

## Actual version : 1.0.0 at nov, 04 2022

# Page Styles

Para cada loja maçônica, simbólica ou altos graus, que tenha um cabeçalho e rodapé definido, foi criado um `pagestyle`.

Para facilitar a chamada de uma determinada `pagestyle` foram definidas opções de declaração da classe `macom.sty`, a saber:

* `arlsap` -- Loja Simbólica "Apóstolos Paulistas"

* `arlsdjf` -- Loja Simbólica "Danylo José Fernandes"

* `sccrcrb` -- Capítulo "Ricardo Bloise"

* `kadoshjc` -- Kadosch "José Caccáos"

* `consistorio` -- Consistório "Pitágoras"

Adicionada a esta opção de definição do Corpo Maçônico foi criado a opção de declaração `timbre`. sendo esta um opção que quando declarado exibirá no cabeçalho o timbro ou logotipo do corpo, caso contrário, ou seja, não seja declarado o timbre não será exibido.

# Function

## \TheMasonicTreatmentPronoun[#1]{#2}

O primeiro parâmetro define "[s]ingular" ou "[p]lural".

O segundo parâmetro usa o número do grau para definir o pronome de tratamento maçônico.

``\TheMasonicTreatmentPronoun{s}{3}``

``Venerável Irmão``

``\TheMasonicTreatmentPronoun{p}{14}``

``Respeitáveis Irmãos``

## \TheDegreeName#1

O parâmetro de input é o Grau o qual retornará o nome (ou descrição).

``\TheDegreeName{4}``

`Mestre Secreto`

## \IrFil[#1]{#2}

Os parâmetros de input são:

* o Grau do Irmão

* o Código do Irmão definido no acrônimo.

``\IrFil[13]{555}``

``Respeitável Irmão Fulano de Tal 13``

## \IIrFil[#1]{#2}

Os parâmetros de input são:

* o Grau dos Irmãos

* uma lista de  Códigos dos Irmãos, definido no acrônimo, separados por vírgula.

``\IIrFil[30]{555,333}``

``Mui Respeitáveis Irmãos Fulano de Tal 30 e Enrolando Relo 30``
