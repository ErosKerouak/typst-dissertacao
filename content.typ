#import "conf.typ"

= Tutorial

== Escrevendo em Typst

O Typst utiliza uma marcação simples para as tarefas de formatação mais comuns. Para adicionar um título, insira o caractere `=`, e para enfatizar um texto em itálico, _coloque-o entre_ `_sublinhados_`.

Para adicionar um novo parágrafo, basta inserir uma linha em branco entre duas linhas de texto. Se esse parágrafo precisar de um subtítulo, crie-o digitando `==` em vez de `=`. O número de caracteres `=` determina o nível hierárquico do título.

Agora queremos listar alguns itens em uma lista numerada. Para fazer isso, digitamos um `+` no começo da linha. O Typst vai numerar os itens automaticamente:

+ primeiro
+ segundo
+ terceiro

Se quisermos adicionar uma lista com marcadores, usamos o caractere `-` em vez do caractere `+`. Também podemos aninhar listas: por exemplo, podemos adicionar uma sublista ao primeiro item da lista acima apenas recuando a linha.

+ primeiro
    - sub 1
    - sub 2
+ segundo
+ terceiro

Certos símbolos específicos (chamados de marcação) têm significados específicos no Typst. Podemos usar `=`, `-`, `+` e `_` para criar, respectivamente, títulos, listas e texto enfatizado. No entanto, ter um símbolo especial para tudo o que queremos inserir no documento logo se tornaria confuso e difícil de manejar. Por isso, o Typst reserva os símbolos de marcação apenas para os elementos mais comuns. Todo o restante é inserido por meio de funções. 

=== Adicionando uma figura

Para que uma imagem apareça na página, usamos a função `image` do Typst. Em geral, uma função produz uma saída a partir de um conjunto de argumentos. Quando chamamos uma função dentro da marcação, fornecemos os argumentos e o Typst insere o resultado (ou seja, o valor de retorno da função) no documento. No nosso caso, a função `image` recebe um argumento: o caminho para o arquivo da imagem. Para chamar uma função na marcação, primeiro digitamos o caractere `#`, seguido imediatamente pelo nome da função. Em seguida, colocamos os argumentos entre parênteses. O Typst reconhece diversos tipos de dados dentro de uma lista de argumentos. Como nosso caminho é uma pequena cadeia de texto, devemos colocá-lo entre aspas duplas.
```typst
#image("figures/237-600x400.jpg", width: 20%)
```
#image("figures/237-600x400.jpg", width: 20%)

A imagem inserida ocupa, por padrão, toda a largura da página. Para modificar isso, passamos o argumento `width` para a função `image`. Esse é um argumento nomeado e, portanto, deve ser especificado como um par nome: valor. Caso existam múltiplos argumentos, eles devem ser separados por vírgulas; por isso, primeiro precisamos colocar uma vírgula após o caminho do arquivo.

O argumento `width` representa um comprimento relativo. No nosso caso, especificamos uma porcentagem, determinando que a imagem deve ocupar 20% da largura da página. Também poderíamos ter usado um valor absoluto, como `1cm` ou `0.7in`.

Assim como o texto, a imagem é alinhada à esquerda da página por padrão. Além disso, ela ainda não possui uma legenda. Vamos corrigir isso utilizando a função `figure`. Essa função recebe o conteúdo da figura como argumento posicional e, opcionalmente, uma legenda como argumento nomeado.

Dentro da lista de argumentos da função `figure`, o Typst já está em modo de código. Isso significa que devemos remover o caractere `#` da chamada da função `image`. O `#` só é necessário quando chamamos uma função diretamente na marcação, para diferenciá-la de texto comum.

A legenda pode conter qualquer marcação. Para passar marcação como argumento de uma função, usamos colchetes. Essa estrutura é chamada de content block.

```typst
#figure(
  image("figures/237-600x400.jpg", width: 70%),
  caption: [
    Figura de teste 
  ],
) <figura>
```

#figure(
  image("figures/237-600x400.jpg", width: 70%),
  caption: [
    Figura de teste 
  ],
) <figura>

Você continua escrevendo seu relatório e agora deseja fazer referência à figura. Para isso, primeiro é necessário atribuir um rótulo (label) à figura. Um rótulo identifica de forma única um elemento no seu documento. Para adicioná-lo, basta colocá-lo após a figura, envolvendo um nome entre sinais de menor e maior (`< >`).

Depois, você pode fazer referência à figura no seu texto escrevendo o símbolo `@` seguido do nome do rótulo (@figura). Títulos e equações também podem ser rotulados dessa forma para permitir referências cruzadas.

=== Adicionando uma bibliografia

O formato nativo de bibliografia do Typst é o Hayagriva, mas, por compatibilidade, também é possível utilizar arquivos BibLaTeX. Você pode adicionar uma bibliografia ao seu documento com a função `bibliography`. Essa função espera o caminho para um arquivo de bibliografia.

```typst
#bibliography("references.yml")
```

Uma vez que o documento contenha uma bibliografia, você já pode começar a fazer citações a partir dela. As citações usam a mesma sintaxe das referências por rótulo. Assim que você citar uma fonte pela primeira vez, ela aparecerá automaticamente na seção de bibliografia do documento. O Typst também oferece suporte a diferentes estilos de citação e bibliografia.

Texto de exemplo:

- A noção moderna de computação teve origem com os trabalhos pioneiros de Turing @turing-1936, cuja formulação teórica fundamenta muitos dos avanços tecnológicos atuais. Já no campo da física, as contribuições de Einstein revolucionaram a compreensão do espaço e do tempo @einstein-relativity. Mais recentemente, estudos sobre mudanças climáticas e seus impactos em ecossistemas costeiros têm ganhado destaque @smith-chapter, refletindo uma crescente preocupação global com questões ambientais.

=== Matemática

O Typst possui um sistema próprio de formatação matemática integrado e utiliza sua própria notação para expressões matemáticas. Para indicar ao Typst que se trata de uma expressão matemática, envolvemos a fórmula com sinais de cifrão (`$`). Por exemplo:
$E = M c^2$.
Esse comando informa ao Typst que deve renderizar a expressão como uma fórmula matemática.

A equação é formatada em linha, ou seja, na mesma linha do texto ao redor. Se você quiser que ela apareça em uma linha separada, basta inserir um espaço em branco antes e depois da expressão:
`$ E = M c^2 $`.
Dessa forma, o Typst entende que a fórmula deve ser destacada em um bloco centralizado, semelhante ao estilo usado para equações exibidas isoladamente.
$ E = M c^2 $

Podemos observar que o Typst exibiu as letras individuais `E`, `M` e `C` exatamente como foram escritas. No modo matemático, letras únicas são sempre mostradas literalmente. Já combinações de várias letras são interpretadas como símbolos, variáveis compostas ou nomes de funções. Para indicar uma multiplicação entre letras únicas, basta inserir espaços entre elas. Se você quiser representar uma variável formada por várias letras, pode colocá-la entre aspas, assim:

```typst
$ "velocity" = d / t $
```
$ "velocity" = d / t $

Nesse caso, `"velocity"` será tratado como um único identificador textual, e não como uma sequência de variáveis multiplicadas.

Para usar o símbolo de somatório (`sum`) e, em seguida, especificar o intervalo da soma com subscrito (para o índice inicial) e sobrescrito (para o índice final), assim:

```typst
$ sum_(i=1)^n x_i $
```

$ sum_(i=1)^n x_i $

Para adicionar um subscrito a um símbolo ou variável, digite o caractere `_` seguido do conteúdo do subscrito. Da mesma forma, use o caractere `^` para indicar um sobrescrito. Se o subscrito ou sobrescrito contiver mais de um elemento, é necessário colocá-lo entre parênteses.

Para inserir frações: basta colocar um caractere `/` entre o numerador e o denominador, e o Typst automaticamente renderiza a expressão como uma fração. 

```typst
$ E_k = (1 / 2) m v^2 $
```
$ E_k = (1 / 2) m v^2 $

Os parênteses são interpretados de forma inteligente, então você pode escrever a expressão como faria em uma calculadora, e o Typst aplicará a notação matemática apropriada às subexpressões entre parênteses.

Nem todas as construções matemáticas possuem uma sintaxe especial. Em vez disso, usamos funções, assim como fizemos anteriormente com a função `image`. Por exemplo, para inserir um vetor coluna, podemos usar a função `vec`.

Dentro do modo matemático, não é necessário começar a chamada da função com o caractere `#`. Basta chamar a função diretamente.

```typst
$ vec(X_1, X_2, X_3) $
```

$ vec(X_1, X_2, X_3) $

Algumas funções estão disponíveis apenas no modo matemático. Por exemplo, a função `cal` é usada para formatar letras em estilo caligráfico, frequentemente utilizadas para representar conjuntos matemáticos.

Além disso, muitos símbolos (como setas, por exemplo) possuem diversas variações. Para selecionar uma variante específica, você pode acrescentar um ponto (`.`) seguido do nome do modificador ao nome do símbolo.

```typst
$ cal(F) $
```
$ cal(F) $

```typst
$ arrow.double $
```
$ arrow.double $

```typst
$ arrow.squiggly $
```
$ arrow.squiggly $

Essa notação também está disponível no modo de marcação (ou seja, fora do modo matemático), mas nesse caso o nome do símbolo deve ser precedido por `#sym`.

== Formatação

=== Regras de formatação

Como passar conteúdo para uma função é algo tão comum no Typst, existe uma sintaxe especial para isso: em vez de colocar o conteúdo dentro da lista de argumentos, você pode escrevê-lo entre colchetes logo após os argumentos normais. Por exemplo, com a função `text`, podemos ajustar a fonte de todo o texto contido nela da seguinte forma:

```typst
#text(font: "Liberation Sans", size: 10pt)[
A noção moderna de computação teve origem com os trabalhos pioneiros de Turing @turing-1936, cuja formulação teórica fundamenta muitos dos avanços tecnológicos atuais. Já no campo da física, as contribuições de Einstein revolucionaram a compreensão do espaço e do tempo @einstein-relativity. Mais recentemente, estudos sobre mudanças climáticas e seus impactos em ecossistemas costeiros têm ganhado destaque @smith-chapter, refletindo uma crescente preocupação global com questões ambientais.
]
```

No entanto, envolver o documento em várias chamadas de função e aplicar estilos de forma pontual e manual pode rapidamente se tornar algo trabalhoso e pouco prático. Por isso, o Typst oferece uma abordagem mais adequada para esse tipo de formatação global: as regras de formatação (*set rules*). Com elas, é possível aplicar propriedades de estilo a todas as ocorrências de um determinado tipo de conteúdo. Para escrever uma regra desse tipo, utiliza-se a palavra-chave `#set`, seguida do nome da função cujas propriedades se deseja definir e de uma lista de argumentos entre parênteses. Por exemplo:

```typst
#set text(font: "Liberation Serif", size: 12pt)
```

Essa instrução define a fonte e o tamanho padrão para todo o texto, sem a necessidade de utilizar `#text()` repetidamente ao longo do documento.

=== Configurar a página

Ao escrever uma regra de formatação, você escolhe a função com base no tipo de elemento que deseja estilizar. Abaixo estão algumas funções comumente utilizadas em set rules:

- `text`: define a família tipográfica, o tamanho da fonte, a cor e outras propriedades do texto.
- `page`: ajusta o tamanho da página, margens, cabeçalhos, rodapés e ativa colunas.
- `par`: controla o espaçamento entre linhas, o alinhamento e outras configurações de parágrafos.
- `heading`: define a aparência dos títulos e ativa a numeração.
- `document`: define os metadados do PDF gerado, como título e autor.

Nem todos os parâmetros de uma função podem ser definidos com set rules. Em geral, apenas os parâmetros que dizem como a função deve se comportar podem ser configurados, e não aqueles que definem com o que ela deve operar. 

```typst
#set page(
  // Margens acadêmicas típicas (padrão ABNT)
  margin: (
    top: 3cm,      // Margem superior
    bottom: 2.5cm, // Margem inferior
    left: 3cm,     // Margem esquerda (encadernação)
    right: 2cm     // Margem direita
  ),

  // Numeração automática no rodapé direito
  numbering: "1/1"
)

#set text(
    font: "Liberation Serif", 
    size: 12pt
    )

#set par(
  justify: true
)
```

Esse exemplo define um conjunto de regras de formatação típicas para um documento acadêmico, seguindo o padrão da ABNT.

A primeira regra é `set page`, que configura as margens da página. Em vez de usar margens uniformes, foi utilizado um dicionário com chaves específicas para cada lado (`top`, `bottom`, `left`, `right`), permitindo ajustar cada margem de forma independente. As margens adotadas são: 3cm no topo e à esquerda (esta última favorecendo a encadernação), 2,5cm na parte inferior e 2cm à direita. A opção `numbering: "1/1"` ativa a numeração automática de páginas, exibindo o número da página no formato "1/1" no rodapé direito.

Em seguida, a regra `set text` define as propriedades globais para o texto: a fonte escolhida é `"Liberation Serif"`, que é uma alternativa livre e compatível com a Times New Roman, bastante usada em textos formais, e o tamanho da fonte é `12pt`, padrão em trabalhos acadêmicos.

Por fim, a regra `set par` aplica a justificação total dos parágrafos (`justify: true`), garantindo que o texto fique alinhado tanto à margem esquerda quanto à direita — outro requisito comum em formatações acadêmicas.

Esse conjunto de regras permite aplicar um estilo coerente e adequado a todo o documento, sem a necessidade de configurar manualmente cada bloco de texto.

=== Um toque de sofisticação

To structure our document more clearly, we now want to number our headings. We can do this by setting the numbering parameter of the heading function.

```typst
#set heading(numbering: "1.")
```

We specified the string "1." as the numbering parameter. This tells Typst to number the headings with arabic numerals and to put a dot between the number of each level. We can also use letters, roman numerals, and symbols for our headings:

```typst
#set heading(numbering: "1.a")
```

This example also uses the lorem function to generate some placeholder text. This function takes a number as an argument and generates that many words of Lorem Ipsum text.

Para estruturar melhor nosso documento, agora queremos numerar os títulos. Podemos fazer isso configurando o parâmetro `numbering` da função `heading`.

```typst
#set heading(numbering: "1.")
```

Neste exemplo, definimos a string `"1."` como valor do parâmetro. Isso instrui o Typst a numerar os títulos com algarismos arábicos, separando os níveis hierárquicos com um ponto. Também é possível utilizar letras, algarismos romanos ou símbolos para formatar a numeração dos títulos:

```typst
#set heading(numbering: "1.a")
```

Nesse caso, o Typst numerará os títulos principais com números e os subtítulos com letras minúsculas (por exemplo, `1.`, `1.a`, `1.b`, etc.).

=== regras de exibição

Com as regras de exibição (show rules), você pode redefinir a forma como o Typst exibe certos elementos. Basta indicar quais elementos devem ser tratados de forma especial e como eles devem ser exibidos. As show rules podem ser aplicadas a palavras específicas, a funções, e até mesmo ao documento inteiro.

```typst
#show "amo ": name => box[
  #name
  #box(image(
    "figures/Liked.svg",
    height: 0.7em,
  ))
]

Eu amo matemática.
```

#show "amo ": name => box[
  #name
  #box(image(
    "figures/Liked.svg",
    height: 0.7em,
  ))
]

Eu amo matemática.

Há bastante sintaxe nova neste exemplo: começamos com a palavra-chave `show`, seguida de uma string de texto que queremos exibir de forma especial, e um dois-pontos. Em seguida, definimos uma função anônima que recebe como argumento o conteúdo que será exibido, neste caso chamamos esse argumento de `name`. Dentro do corpo da função, podemos usar a variável `name` para exibir o nome onde ele aparecer no texto.

Nossa show rule insere uma imagem de logotipo antes do nome e envolve o conjunto em um `box`, impedindo quebras de linha entre a imagem e o texto. A imagem também é colocada em um `box` separado para evitar que seja renderizada em um parágrafo isolado.

As chamadas para as funções `box` e `image` não precisam de `#` no início, pois não estão diretamente embutidas na marcação. Sempre que o Typst estiver esperando código, como em listas de parâmetros, definições de função ou blocos de código (como o corpo de uma `show rule`), o uso do `#` é desnecessário para acessar funções, palavras-chave e variáveis.

#bibliography("references.yml")