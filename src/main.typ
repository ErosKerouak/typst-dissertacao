= Introdução 

O presente trabalho tem como objetivo principal integrar dados gravimétricos terrestres e satelitais para gerar um modelo geofísico que permita investigar as heterogeneidades estruturais e composicionais em subsuperfície. Um desafio metodológico significativo, em razão das diferenças intrínsecas entre esses dois tipos de dados. 

Uma área correspondente a Província Mantiqueira Meridional (sul do Brasil), foi selecionada como estudo de caso (FIGURA @mapa_de_localização). Inicialmente, foram realizadas a compilação e o pré-processamento dos dados gravimétricos terrestres e satelitais disponíveis para a região. Foram utilizados dois conjuntos de dados satelitais: uma grade regular definida em altitude geodésica constante e os valores estimados diretamente nos pontos de observação terrestre $P(phi, lambda, h)$. Os valores interpolados pelo método das fontes equivalentes (@dampney1969equivalent, @cooper2000gridding, @Soler2021) correspondem às diferenças entre os dados terrestres e os dados satelitais em cada ponto $P(phi, lambda, h)$. Para a determinação dos parâmetros ótimos de interpolação por fontes equivalentes (_depth_ e _damping_), foi empregada validação cruzada do tipo _k-fold_ @Roberts2017. A grade final integrada foi obtida a partir da soma do produto da interpolação das diferenças com a grade satelital em altitude constante. 

#figure(
  image("../figures/mapa_localização.png", width: 90%),
  caption: [Localização das estações gravimétricas (representadas por círculos roxos). As áreas sem dados estão destacadas em preto, enquanto os cinturões orogênicos Ribeira e Dom Feliciano estão demarcados em vermelho.],
) <mapa_de_localização>


A gravidade teorica foi calculada para cada celulda da grade, gerando-se o distúrbio da gravidade. Para as correções de terreno e _backstripping_, a topografia e as camadas sedimentares foram discretizadas em prismas, modelados a partir de modelos digitais de elevação e dados de espessura dos sedimentos. Essas correções, que mais tradicionalmente são aplicada às anomalias de Ar Livre, foram aplicada ao distúrbio da gravidade, resultando no chamado Distúrbio de Bouguer. Conforme definido por @segawa1984gravity, essa é uma adaptação do conceito tradicional de anomalia de Bouguer para distúrbios da gravidade em vez de anomalias de Ar Livre, proporcionando uma leitura mais precisa do campo de gravidade, menos afetada pelas ondulações do geoide e mais diretamente relacionada às variações de densidade subterrâneas @segawa1984gravity. Para completar as coreções, a interface crustal Moho também foi estimada com base na hipótese de Airy e modelada com tesseróides para a realização da correção isostática.


= Contexto Geologico

Formada durante a colagem orogênica Brasiliana, a Província Mantiqueira se estende ao longo de uma faixa paralela à costa Atlântica, do sul da Bahia até o Uruguai \citep{almeida1981, heilbron2004}. Este sistema orogênico é subdividido em três segmentos geográficos: o segmento setentrional, representado pelo Cinturão Araçuaí; o segmento central, composto pelo Cinturão Ribeira; e o segmento meridional, que inclui o Cinturão Dom Feliciano \citep{heilbron2004}. Cada um desses cinturões orogênicos apresenta um conjunto especifico de terrenos tectono-estratigráficos, no sentido proposto por \citet{howell2013tectonics}, ou seja, pacotes de rochas delimitados por falhas que possuem estratigrafia distinta, definindo um contexto geológico específico. Segundo \citet{howell2013tectonics}, um terreno tectonoestratigráfico é uma peça única no quebra-cabeça orogênico. Devido à mobilidade intrínseca implícita pela existência de um sistema orogenético, os cinturões orogênicos são como caixas de quebra-cabeça preenchidas apenas com algumas das peças de mais de um quebra-cabeça. Identificar tais peças é necessário para compreender a sequência de eventos que resultaram em um dado cinturão orogênico. 

Os terrenos tectonoestratigráficos são geralmente caracterizados por sua estratigrafia e paleogeografia distintiva, e identificá-los requer dados descritivos estratigráficos e estruturais \citep{howell2013tectonics}. No segmento central da Província Mantiqueira, os terrenos Ocidental, Paraíba do Sul, Oriental, Cabo Frio, Apiaí, São Roque, Embu, Costeiro, Curitiba e Paranaguá compõem o Cinturão Ribeira \citep{Schmitt2004late, cury2009geologia, Heilbron2017, campanha2023southern, ribeiro2023laurentian}. Ao passo que, no segmento meridional, os terrenos Nico Pérez/Taquarembó, São Gabriel, Tijucas, Punta del Este e o Batólito Florianópolis-Pelotas-Aiguá caracterizam o Cinturão Dom Feliciano \citep{Hueck2018, Oyhantçabal2018, Philipp2018}. Enquanto o Cráton Luís Alves, posicionado ao sul do Terreno Curitiba e ao norte do Grupo Brusque (setor catarinense do Terreno Tijucas), é o que separa os cinturões Ribeira e Dom Feliciano \citep{basei1992evoluccao, Passarelli2018}. 

Da porção sul do Cinturão Ribeira até o limite meridional do Cinturão Dom Feliciano, a delimitação completa dos terrenos tectonoestratigráficos é limitada pelo contato sedimentar com a Bacia do Paraná, que os encobre em grande parte. Diante disso, considerando que as distintas associações litológicas implicam variações de densidade e que os contatos estão frequentemente associados a litologias de maior densidade devido a processos intrusivos e/ou metamórficos, este trabalho poderá revelar a continuidade lateral dos terrenos e suas estruturas nas áreas encobertas, explicitando também a integração da Província Mantiqueira com o embasamento da Bacia do Paraná.


\chapter{Fundamentação Teorica}

\vspace{-15mm}
A Lei da Gravitação Universal, formulada na obra "Philosophiae naturalis principia mathematica" \citep{newton1687principia}, descreve a gravidade como uma força de atração mútua entre duas partículas, proporcional ao produto de suas massas e inversamente proporcional ao quadrado da distância que as separa \citep{halliday2016}. Se as massas das partículas são $m_1$ e $m_2$, e a distância entre elas é $l$, o módulo da força gravitacional $F_g$ que uma exerce sobre a outra é dado por:

\vspace{-12pt}

\begin{equation}\label{eq:gravitacao}
     F_g = G\cdot \dfrac{m_1 \cdot m_2}{l^2} \hspace{5pt}  \text{,}  
\end{equation}

\noindent em que $G$ representa a constante gravitacional, cujo valor é $6,674 \times 10^{-11}\ m^3\cdot kg^{-1}\cdot s^{-2}$ \citep{halliday2016}.

Rigorosamente, a Lei da Gravitação Universal é aplicável apenas a partículas (corpos que podem ser considerados pontos no espaço) \citep{halliday2016}. No entanto, podemos generalizá-la para objetos do mundo real. Quando lidamos com objetos que possuem dimensões físicas, podemos tratá-los como partículas com precisão suficiente, desde que essas dimensões sejam muito menores em comparação com a distância que os separa \citep{halliday2016}. Quando essa simplificação não atende aos padrões de precisão necessários, é possível calcular o potencial gravitacional de um objeto real (com dimensões finitas) utilizando o \textit{princípio da superposição}, que permite calcular o efeito total somando os efeitos parciais \citep{Blakely1996, halliday2016}. 

O vetor da força gravitacional exercido por uma distribuição contínua de massa com densidade \(\rho\) sobre uma massa pontual \(m\), localizada em um ponto \(P\) é obtido por:

\vspace{-12pt}

\begin{equation}\label{eq:superposicao_forca}
    \vec{F}(P) = Gm \int_v \frac{\rho(q)}{l^2(P, q)} \frac{\vec{l}(P, q)}{l(P, q)} \, dv(q) \text{,}
\end{equation}

\noindent
onde \(\vec{l}(P, q)\) conecta o ponto \(P\) ao elemento de volume \(dv\) no ponto \(q\) \citep{barthelmes2014global}. A aceleração gravitacional \(\vec{a}(P)\), derivada dessa força dividida pela massa \(m\), é dada por:

\vspace{-12pt}

\begin{equation}
    \label{eq:ace_ditr_den}
    \vec{a}(P) = G \int_v \frac{\rho(q)}{l^2(P, q)} \frac{\vec{l}(P, q)}{l(P, q)} \, dv(q) \text{.}
\end{equation}

\noindent
Esse campo vetorial pode ser expresso como o gradiente de um potencial escalar \(V(P)\):

\vspace{-12pt}

\begin{equation}
    \label{eq:nebla}
    \vec{a}(P) = \nabla V(P) \text{,}
\end{equation}

\noindent
O potencial \(V\) é determinado por \(\vec{a}\) e uma constante desconhecida, a qual é usualmente definida de forma que o potencial \( V \) se anule no infinito. Assim,  \(V(P)\) representa a energia necessária para mover uma massa unitária de \(P\) ao infinito, sendo sempre positivo e decrescente com a distância \citep{barthelmes2014global}. O potencial gravitacional é dado por:

\vspace{-12pt}

\begin{equation}
    \label{eq:pot_dis_massa}
    V(P) = G \int_v \frac{\rho(q)}{l(P, q)} \, dv(q) \text{,}
\end{equation}

\noindent
Essa função satisfaz a equação de Poisson:

\vspace{-12pt}

\begin{equation}
    \label{eq:poisson}
    \nabla^2 V(P) = -4 \pi G \rho(P) \text{,}
\end{equation}

\noindent
Fora das massas, onde \(\rho = 0\), o potencial cumpre a equação de Laplace, caracterizando-se como função harmônica:

\vspace{-12pt}

\begin{equation}
    \label{eq:poisson_vazio}
    \nabla^2 V(P) = 0 \text{.}
\end{equation}


%Em matemática, uma função que satisfaz a equação de Laplace é denominada função harmônica. Todo potencial pode ser representado por superfícies equipotenciais — superfícies onde o valor do potencial é constante. Além disso, a teoria das funções harmônicas estabelece que o conhecimento de uma única superfície equipotencial é suficiente para determinar completamente a função harmônica correspondente.



\section{Potencial Gravitacional Normal}

Em uma primeira aproximação, a Terra é uma esfera; em uma segunda aproximação, ela torna-se um elipsoide de revolução \cite{hofmann2006physical}. O elipsoide de referência é uma representação geométrica simplificada do formato terrestre, possuindo a mesma velocidade angular e a mesma massa que a Terra real levando-se em consideração as massas dos oceanos e atmosfera. \citep{Blakely1996, gemael2019}. O potencial gravitacional total do elipsoide, $U$, conhecido como potencial gravitacional normal, é a soma do seu potencial de atração $U_g$ e o potencial de rotação $U_r$ \citep{Blakely1996, gemael2019},

\begin{equation}\label{Equação o potencial total do esferoide}
    U = U_g + U_r  \hspace{5pt} \text{.}
\end{equation}

O campo de gravidade do elipsoide é um conceito teórico fundamental do ponto de vista prático, pois é fácil de tratar matematicamente, e as discrepâncias do campo de gravidade real em relação ao campo teórico, ou normal, são pequenas \cite{hofmann2006physical}. Embora um elipsoide possua diversos parâmetros geométricos e físicos, ele pode ser completamente definido por quatro parâmetros fundamentais independentes: a constante gravitacional geocêntrica $GM$, o semi-eixo maior $a$, o achatamento $f$, e a velocidade angular $\omega$ \cite{Blakely1996}. 

\subsection{Theoretical gravity}\label{subsubsec:gama}

A força inercial centrífuga gerada pelo movimento de rotação terrestre atinge seu máximo no equador, em virtude da maior velocidade angular, e diminui de forma inversamente proporcional à latitude, tornando-se nula nos polos. Como resultado desse fenômeno, o potencial gravitacional da Terra próximo à sua superfície varia em função da latitude $\phi$. Usando os parâmetros de um elipsoide de referência, é possível estimar uma gravidade teórica $\gamma$ para qualquer latitude $\phi$. As equações usadas para calcular a gravidade teórica, baseadas no Teorema de Clairaut, geralmente são expressas como:

\begin{equation}
    \gamma = \gamma_a (1 - \beta \sin^2 \phi + \beta_1 \sin^2 2 \phi + \text{termos de ordem superior})
\end{equation}

\noindent onde $\gamma$ e $\gamma_a$ representam a gravidade normal, respectivamente, na latitude $\phi$ e no equador \cite{gemael2019}. Os coeficientes $\beta$ e $\beta_1$ dependem exclusivamente dos parâmetros do elipsoide \cite{Blakely1996}.

Essa Equação é uma expansão em série, mas também é possível usar as expressões em forma fechada para a gravidade teórica \cite{li2001ellipsoid}. No caso de $\gamma$ na superfície do elipsoide, pode-se usar a  Fórmula de Somigliana \citep{Blakely1996, li2001ellipsoid, hofmann2006physical}. Da mesma forma, a gravidade teórica em qualquer altura $h$ em relação ao elipsoide também pode ser calculada por uma fórmula fechada, por exemplo a Fórmula de Lankshmanan e LiGötze \citep{lakshmanan1991generalized, gotze1996topography, li2001ellipsoid}.

\section{Potencial Gravitacional Anômalo}
Enquanto o elipsoide de referencia é concebido como uma superfície equipotencial idealizada de uma Terra homogênea, a superfície equipotencial verdadeira, que melhor corresponde ao nível dos oceanos sem perturbações, é chamada de geoide \citep{Blakely1996, gemael2019}, ideia concebida por \cite{gauss1828bestimmung} com denominação dada posteriormente por \cite{listing1872unsere}, \cite{Grafarend1993Geoid}. A pequena diferença entre o potencial de gravidade real, $W$, e o potencial de gravidade normal, $U$, equivale ao chamado potencial anômalo, $T$. Considerando que o potencial de rotação, $U_r$, mantém-se constante tanto para o elipsoide de referência quanto para a Terra real, sua influência é neutralizada em $T$ \citep{gemael2019, hofmann2006physical},

\begin{align}
    W &= U + T \nonumber \\ \vspace{12pt}
    T &= W - U \hspace{5pt} \text{.}
\end{align}

\subsection{Gravity Anomaly and Gravity Disturbance}
Considerando $P$ e $Q$ pontos localizados respectivamente nas superfícies do geoide e do elipsoide, uma anomalia de gravidade $\Delta g$ é definida como a diferença entre o módulo do vetor gravidade real na superfície do geoide, $g_P$, e o módulo do vetor gravidade teórica na superfície do elipsoide, $\gamma_Q$, conforme a seguinte Equação \cite{hofmann2006physical}:

\begin{equation}\label{Equaçãoanomalia de gravidade}
    \Delta g = g_P - \gamma_Q  \hspace{5pt} \text{.}
\end{equation}

Além disso, pode-se realizar uma comparação entre os módulos de $g_P$ e $\gamma_P$, isto é, entre o módulo do vetor gravidade real e o módulo do vetor gravidade teórica, ambos no mesmo ponto $P$. Essa comparação resulta no cálculo do distúrbio da gravidade, $\delta g$, expresso pela Equação \cite{hofmann2006physical}:

\begin{equation}\label{Equaçãodisturbio gravitacional}
    \delta g = g_P - \gamma_P \hspace{5pt} \text{.}
\end{equation}

O cálculo da gravidade teórica na altitude \(h\) (conforme indicado no item \ref{subsubsec:gama}) permite a determinação do distúrbio da gravidade na superfície terrestre. Uma vez que \(g_{\text{obs}}\) e \(\gamma_h\) estão sobre o mesmo ponto \(P_{\text{obs}}\), basta realizar a diferença entre a gravidade observada \(g_{\text{obs}}\) e \(\gamma_h\) em cada ponto de observação \(P_{\text{obs}}\), com ambas as gravidades em regime de maré livre (tide free),

\begin{equation}\label{eq:gravit_d2}
    \delta g = g_{\text{obs}} - \gamma_h \text{.}
\end{equation}

\subsection{Bouguer Anomaly and Bouguer Disturbance}\label{subsubsec:bouguer}

A magnitude do vetor gravidade real no geoide é determinada por meio de processos de redução gravimétrica. Nesse âmbito, são utilizadas diversas abordagens, como a correção ao ar livre, a correção de Bouguer e a condensação de Helmert, resultando nas denominadas anomalias de ar livre e de Bouguer, entre outras \cite{heiskanen1967physical}. Essas ferramentas e conceitos são compartilhados por duas disciplinas: a geodésia e a geofísica. Contudo, apesar de os métodos serem comuns a ambas as geociências, a maneira de aplicá-los difere devido a objetivos distintos. Na geodésia, a gravidade é utilizada para definir o geoide e suas ondulações, servindo como referência para medições de altitude e para o mapeamento preciso da Terra. Na geofísica, a gravidade auxilia na identificação de feições geológicas através das variações de densidade subsuperficiais \cite{li2001ellipsoid}. 

Para a geodésia, o distúrbio da gravidade na superfície terrestre $\delta g$, obtido pela Equação \ref{eq:gravit_d2}, dispensa a necessidade de reduções adicionais. Por outro lado, na geofísica, a aplicação da redução de Bouguer ao Distúrbio da Gravidade permite obter o Distúrbio Bouguer, adaptando o conceito tradicional de Anomalia Bouguer para Distúrbios da Gravidade em vez de anomalias de ar livre, método estabelecido por \cite{segawa1984gravity}. A introdução do Distúrbio Bouguer proporciona uma medição geofísica mais precisa, menos afetada pelas ondulações do geoide e, consequentemente, mais diretamente relacionada às variações de densidade subsuperficiais, tornando-a particularmente útil para estudos geofísicos e geológicos que visam compreender a estrutura da crosta terrestre e do manto superior \cite{segawa1984gravity}. Além disso, tem-se o uso direto das altitudes elipsoidais que hoje são mais precisas que as altitudes ortométricas e diretamente obtidas via posicionamento GNSS.

Assumindo que a área ao redor do ponto de observação $P_{obs}$ é completamente plana e horizontal, a massa entre o nível do geoide e o ponto de observação formaria um platô homogêneo e infinitamente extenso, com densidade constante $\rho$ e espessura igual à altitude $H$ do ponto de observação. Esse platô hipotético, plano, horizontal, homogêneo e infinito, é o denominado Platô de Bouguer, o qual pode ser considerado um cilindro com espessura $H$, com o raio $r$ tendendo ao infinito $r \rightarrow \infty$ \cite{hofmann2006physical}. A atração gravitacional $C_b$ que o Platô de Bouguer exerceria no ponto $P_{obs}$ é dada por \cite{hofmann2006physical}:

\begin{equation}
    C_b = 2  \pi  G  \rho  H \text{.}
\end{equation}

\noindent O Distúrbio Bouguer simples $\delta g_b$ é obtido subtraindo o valor da atração do Platô de Bouguer $C_b$ do valor do distúrbio da gravidade  $\delta g$,

\begin{align}
    \delta g_b &= g_{obs} - \gamma_h - C_b \nonumber \\
                 &= \delta g - C_b
\end{align}

Os vales e elevações no entorno do ponto de observação não são considerados no Platô de Bouguer, mas tem influencia na gravidade observada. Por esse motivo, convém refinar o distúrbio Bouguer levando em consideração a discrepância entre a topografia real e o Platô de Bouguer, processo chamado de correção topográfica \cite{hofmann2006physical}, o resultado é o distúrbio Bouguer refinado. A redução de Bouguer e as correspondentes anomalias ou distúrbios de Bouguer são chamadas de refinadas ou simples, dependendo se a correção topográfica foi aplicada ou não \cite{hofmann2006physical}.

\begin{align}
    \delta g_B &= g_{obs} - \gamma_h - C_b + C_t \nonumber \\
                 &= \delta g - C_b + C_t \nonumber \\
                 &= \delta g_b + C_t \hspace{5pt} \text{.}
\end{align}

Por esse método, a Redução Bouguer é realizada em duas etapas: o efeito do Platô de Bouguer, representado por \(C_b\), e a correção topográfica, indicada como \(C_t\). Porém, também é possível calcular o efeito total das massas topográficas em um procedimento unificado. Para esse fim, modelam-se as massas usando prismas retangulares (Figura \ref{fig:Terrain Correction}), permitindo que o efeito gravitacional de cada um dos prismas seja determinado em cada ponto de observação \cite{hofmann2006physical}. 

\begin{align}\label{eq:prismas}
    \delta g_B   &= g_{obs} - \gamma_h - C_P \nonumber \\
                 &= \delta g - C_P \hspace{5pt} \text{.}
\end{align}

Através da comparação entre os valores medidos e os valores previstos para os mesmos pontos, o Distúrbio Bouguer revela massas anômalas cujas densidades excedem ou são menores que um valor médio teórico, $\rho$. O valor de $2670 \hspace{12pt} kg/m^3$, proposto por \cite{harkness1891solar} com base em rochas cristalinas, é comumente adotado \cite{hinze2003bouguer}. No entanto, essa premissa muitas vezes não reflete a realidade de maneira precisa, como demonstrado para o território brasileiro por \cite{Madeiros2021densityBrazil}.

\subsection{Modelos Geopotencias Globais}


Os modelos geopotenciais globais são aproximações matemáticas do potencial gravitacional real da Terra. A partir desse potencial aproximado, todos os funcionais relacionados (potencial de gravidade, vetor gravidade, gravidade) podem ser calculados (Barthelmes, 2013). Para funções específicas, como a altura do geóide, a anomalia e o distúrbio da gravidade, é necessário utilizar um sistema de referência definido, como o GRS80 \citep{Moritz1980}. Como o efeito centrífugo é facilmente modelado e já incorporado nesses sistemas, o principal desafio está na modelagem do potencial gravitacional. 

Embora existam diversas representações matemáticas possíveis, na prática predominam os harmônicos esféricos sólidos. Estes formam um conjunto ortogonal de soluções para a equação de Laplace em coordenadas esféricas. Assim, o potencial gravitacional terrestre \( V \) pode ser expresso por uma expansão em harmônicos esféricos:

\begin{align}\label{eq:ha-esfericos}
    V(r, \lambda, \varphi) = \dfrac{GM}{r} \sum_{\ell = 0}^{\ell_{\text{max}}} \sum_{m = 0}^{\ell} \left( \dfrac{R}{r} \right)^{\ell} P_{\ell m}(\sin \varphi)\left(C_{\ell m} \cos m\lambda + S_{\ell m} \sin m\lambda \right) \text{.}
\end{align}


onde \( r, \lambda, \varphi \) são as coordenadas esféricas geocêntricas (raio, longitude, latitude), \( R \) é o raio de referência, \( GM \) é o produto da constante gravitacional \( G \) pela massa terrestre \( M \), \( \ell \) e \( m \) são o grau e ordem dos harmônicos, \( P_{\ell m} \) são funções de Legendre normalizadas, e \( C_{\ell m}, S_{\ell m} \) são coeficientes normalizados de Stokes. As funções de Legendre são normalizadas conforme:


\begin{align}\label{eq:legendre}
    \frac{1}{4\pi} \int_{\lambda = 0}^{2\pi} \int_{\varphi = -\pi/2}^{\pi/2} \left[ P_{\ell m}(\sin \varphi) \cos m\lambda \right]^2 \cos \varphi \, d\varphi d\lambda = 1 \text{.}
\end{align}

Nessa formulação, um modelo global é definido pelos parâmetros \( GM, R \), pelos coeficientes \( C_{\ell m}, S_{\ell m} \) e pelo grau máximo \( \ell_{\text{max}} \), que determina a resolução espacial do modelo. A precisão e a resolução do modelo dependem diretamente da exatidão dos coeficientes e do valor escolhido para \( \ell_{\text{max}} \). O efeito centrífugo pode ser incluído utilizando a velocidade angular terrestre \( \omega \). A partir dessa expansão, outros funcionais do campo gravitacional, como o vetor gravidade \( \vec{g} \), podem ser facilmente obtidos.

Historicamente, desde a formulação da lei da gravitação universal por Newton (1687), modelos gravitacionais básicos têm sido aprimorados continuamente, especialmente após o advento da geodésia espacial. As perturbações orbitais dos satélites artificiais da Terra, decorrentes das irregularidades no campo gravitacional, possibilitaram o cálculo preciso dos coeficientes harmônicos. Destacam-se nesse processo os satélites Starlette e LAGEOS, que utilizaram telemetria a laser, e posteriormente as missões CHAMP, GRACE e GOCE, que empregaram tecnologias avançadas como GNSS, acelerômetros e gradiômetros gravitacionais. Essas missões revolucionaram os modelos geopotenciais, permitindo observar variações do campo gravitacional terrestre em escalas espaciais e temporais muito mais refinadas. Os modelos atuais são classificados em modelos baseados exclusivamente em dados de satélite (\textit{satellite-only}), com resolução espacial global uniforme, e modelos combinados, que integram medições terrestres e alcançam resoluções espaciais mais detalhadas em áreas com maior densidade e precisão de dados. 


\subsection{O Método das Fontes Equivalentes}


A técnica das fontes equivalentes é um método para interpolar campos potenciais observados, como dados gravimétricos e magnéticos. Este método consiste em estipular uma distribuição de fontes que produziria o campo potencial observado. O campo dessas fontes idealizadas poderá então ser calculado em qualquer lugar acima das medições. Este procedimento de dois passos, um problema inverso seguido por um cálculo direto, fornece um modo de continuar campos potenciais de superfície para superfície \cite{Blakely1996}. As fontes hipotéticas devem produzir um campo potencial que seja harmônico na área de interesse, desapareça no infinito e reproduza o campo observado, não é preciso que assemelhem-se à verdadeira distribuição de fontes \cite{Blakely1996}. 

Sobre um plano localizado abaixo dos pontos de observação, presume-se a existência de fontes pontuais dotadas das propriedades exatas necessárias para simular um campo equivalente ao observado. Ou seja, o potencial gravitacional desse arranjo idealizado de fontes pontuais deve ser indistinguível do potencial produzido pelas fontes tridimensionais reais. Ao definir essa camada equivalente, se possibilita o cálculo de seu potencial em qualquer ponto desejado, o que, mantendo a profundidade desta camada dentro dos limites impostos pelo espaçamento dos dados, resulta em uma aproximação precisa do campo gravitacional real nesses mesmos pontos. Assim, o campo real para espaços sem dados pode ser estimado para fins de interpolação, permitindo a projeção de uma grade regular \cite{dampney1969equivalent}. 


Esse método se distingue das técnicas convencionais (como: média ponderada, mínima curvatura ou krigagem) que interpolam valores sem considerar seus atributos específicos, pois depende diretamente da natureza dos dados utilizados para a interpolação \cite{cooper2000gridding}. Isso garante o comportamento analítico correto do campo projetado, dando precisão na interpolação de dados potenciais dispostos irregularmente e em diferentes elevações \citep{dampney1969equivalent, cooper2000gridding}.



\chapter{Metodologia}

\vspace{-15mm}

\section{Tipo de Pesquisa}


O presente trabalho configura-se como uma pesquisa metodológica, orientada para o desenvolvimento e aprimoramento de técnicas de integração de dados geofísicos, com ênfase na análise gravimétrica. A abordagem adotada é predominantemente qualitativa, embora certos procedimentos, como a aplicação do processo de 
\textit{backstripping}, incorporem elementos semiquantitativos. 

Quanto ao procedimento técnico, caracteriza-se como um estudo de caso, centrado na análise integrada de dados gravimétricos terrestres e satelitais sobre uma área geológica específica. Em etapas posteriores do projeto, prevê-se a utilização de modelos sintéticos para a validação das metodologias aplicadas; entretanto, para a presente etapa de qualificação, o foco recai exclusivamente sobre a aplicação em dados reais.

O objetivo principal é integrar dados gravimétricos de diferentes fontes para a geração de um modelo geofísico que permita investigar as heterogeneidades estruturais e composicionais em subsuperfície.


%Os dados terrestres, embora apresentem alta resolução, são distribuídos de forma irregular e estão sujeitos a erros sistemáticos e ruídos decorrentes da aquisição manual. Para mitigar essas limitações, foram adotadas duas estratégias: a estimativa da resolução ideal da grade de interpolação, por meio do método da contagem de caixas (box-counting), ajustando a malha à distribuição espacial das estações; e o desenvolvimento de um metodo iterativo de ponderação baseada em fontes equivalentes, com o objetivo de reduzir a influência de valores espúrios na interpolação. Essas abordagens contribuem para aumentar a compatibilidade com os dados satelitais, que, apesar de apresentarem consistência global e distribuição regular, possuem menor resolução espacial.

%A discrepância entre os dados gravimétricos terrestres e satelitais também se manifesta na sensibilidade espacial das medições: enquanto os dados terrestres, adquiridos próximos à superfície, capturam variações locais de alta frequência e curto comprimento de onda, os dados satelitais, obtidos a altitudes elevadas, registram predominantemente componentes de baixa frequência, representando efeitos regionais ou globais. Para compatibilizar essas diferenças no contexto das correções de terreno e backstripping, a topografia e as camadas sedimentares foram modeladas como prismas, gerando duas versões para cada camada  uma contendo as componentes de alta frequência e outra com as de baixa frequência, diferenciadas pela aplicação de um filtro gaussiano passa-baixa ao modelo de elevação. As correções derivadas dessas versões foram, então, ponderadas com base na distância entre cada celula da grade e a estação terrestre mais próxima, de modo que as componentes de alta frequência fossem priorizadas nas regiões com influência direta dos dados terrestres, enquanto as de baixa frequência predominassem em áreas com menor cobertura de medições de superfície.

\section{Área de Estudo}

A área de estudo está compreendida entre as longitudes \(-55{,}74058^\circ\) e \(-46{,}50524^\circ\) e as latitudes \(-33{,}75118^\circ\) e \(-22{,}51703^\circ\), abrangendo a totalidade dos estados do Paraná e de Santa Catarina, a maior parte do Rio Grande do Sul, a porção sul do Mato Grosso do Sul e de São Paulo, além de pequenas áreas nos países vizinhos Paraguai, Argentina e Uruguai.

Do ponto de vista geológico, a área recobre a porção meridional da Província Mantiqueira, incluindo o Orógeno Dom Feliciano e o segmento sul do Orógeno Ribeira, bem como uma parcela significativa da Bacia do Paraná. A caracterização geológica das unidades da porção sul do Cinturão Ribeira até o limite meridional do Dom Feliciano é dificultada pela cobertura sedimentar da Bacia do Paraná, que oculta extensas áreas de embasamento. Nesse sentido, a seleção desta área como estudo de caso justifica-se pela possibilidade de aplicar metodologias gravimétricas para investigar a continuidade lateral de estruturas e a presença de terrenos ocultos, utilizando a integração de dados terrestres e satelitais. Embora a principal finalidade do trabalho seja metodológica, espera-se que os resultados obtidos possam fornecer subsídios adicionais para a interpretação da arquitetura crustal da região.

\section{Dados Gravimétricos}

Foram utilizados dados gravimétricos terrestres provenientes de 73.299 estações distribuídas ao longo da área de estudo. Esses dados foram levantados por diversas instituições, incluindo a Petróleo Brasileiro S.A. (Petrobras), a Agência Nacional do Petróleo, Gás Natural e Biocombustíveis (ANP), o Instituto de Astronomia, Geofísica e Ciências Atmosféricas da Universidade de São Paulo (IAG/USP), o Instituto Brasileiro de Geografia e Estatística (IBGE), o Observatório Nacional (ON), o Serviço Geológico do Brasil (SGB/CPRM), a Universidade Federal do Paraná (UFPR) e a \textit{Administración Nacional de Combustibles, Alcoholes y Portland} (ANCAP). A maior parte dessas informações integra a compilação disponibilizada pelo Banco Nacional de Dados Gravimétricos (BNDG).

Complementarmente, foram empregados dados de gravidade observada derivados de modelos satelitais. O modelo utilizado foi o GOCO06s \citep{goco}, obtido através do portal \textit{International Centre for Global Earth Models (ICGEM)} \citep{Ince2019}. O GOCO06s é um modelo de campo de gravidade global combinado, baseado em dados dos satélites GOCE e GRACE, integrados a observações terrestres e altimétricas, com grau e ordem máximos de 300 \citep{goco}.

Ambas as bases de dados referem-se à gravidade observada. Os produtos derivados, tais como o distúrbio de gravidade e a anomalia de Bouguer, foram obtidos posteriormente, durante as etapas de processamento.


\section{Modelos de Elevação e Dados Geológicos Auxiliares}

O modelo de elevação utilizado neste trabalho foi construído a partir da combinação de dois modelos digitais globais. Para a topografia continental, adotou-se o \textit{Forest And Buildings removed Copernicus DEM} (FABDEM) \citep{fabdem}, enquanto para a batimetria das áreas oceânicas próximas, utilizou-se o modelo SRTM15+, que integra dados altimétricos e batimétricos com resolução de 15 segundos de arco \citep{srtm15plus}.

A modelagem da cobertura sedimentar foi baseada na integração de três diferentes conjuntos de dados: o shapefile de isopacas da cobertura sedimentar do Mapa Tectônico da América do Sul \citep{cordani2016}, os dados em formato xyz do modelo CRUST 1.0 \citep{crust1.0} e o modelo global de espessura sedimentar \textit{Total Sediment Thickness of the World's Oceans and Marginal Seas} \citep{noaa}.

Para a espessura dos basaltos da Formação Serra Geral, utilizou-se o mapa de isopacas publicado por \citet{Zaln1990}, a partir da vetorização de figura disponível em artigo, uma vez que não foi encontrado o dado em formato digital. Já o contorno estrutural da base do basalto foi obtido a partir do mapa do topo do Aquífero Guarani \citep{Arjo1999}, também vetorizarizado a partir de material gráfico.

\section{Softwares e Ambiente Computacional}

O tratamento e a análise dos dados foram realizados majoritariamente utilizando a linguagem de programação \textit{Python}, em ambiente local configurado com o gerenciador de pacotes \textit{Conda}. O ambiente de trabalho foi implementado no \textit{Visual Studio Code} com suporte à execução de \textit{notebooks Jupyter}.

As principais bibliotecas empregadas pertencem ao projeto \textit{Fatiando a Terra} \citep{Uieda2013}, voltado ao desenvolvimento de ferramentas para análise e modelagem de dados geofísicos. Dentre essas bibliotecas, destacam-se: \textit{Verde} \citep{uieda2018}, utilizada para interpolação espacial; {Harmonica} \nocite{Harmonica}, para cálculos gravimétricos e modelagem de fontes equivalentes; e \textit{Boule} \nocite{Boule}, para operações envolvendo modelos de elipsoides de referência.

Adicionalmente, foram utilizadas diversas bibliotecas complementares, incluindo \textit{NumPy} e \textit{SciPy} para operações numéricas, \textit{Pandas} para manipulação de dados tabulares, \textit{Xarray} e \textit{NetCDF4} para gerenciamento de dados matriciais, \textit{Matplotlib} e \textit{Seaborn} para visualização gráfica, \textit{Rasterio} e \textit{Rioxarray} para manipulação de dados geoespaciais rasterizados, e \textit{Geopandas} e \textit{Shapely} para análise de dados vetoriais.

Para a manipulação e vetorização de dados geológicos e geofísicos, foi também utilizado o \textit{software} QGIS, permitindo o tratamento de arquivos vetoriais (\textit{shapefiles}) e a conversão de dados gráficos para formatos compatíveis com o processamento em \textit{Python}.

O ambiente \textit{Conda} utilizado foi denominado \textit{gravimetry-mantiqueira}, e inclui ainda dependências auxiliares, como o compilador \textit{LaTeX} \textit{Tectonic}, utilizado para a produção de documentos científicos.

\section{Procedimentos Gerais de Processamento}


\subsection{Processamento do Modelo de Geóide}

A primeira etapa do processamento consistiu na obtenção de um modelo de geóide de alta resolução para a América do Sul, com o objetivo de possibilitar a conversão de elevações ortométricas em alturas elipsoidais nas estações gravimétricas que não apresentavam essa informação. 

O modelo utilizado foi o \textit{"The South American gravimetric geoid: GEOID2021"}, desenvolvido por \citet{GEOID2021}, disponível no portal da \textit{International Service for the Geoid (ISG)}. O \textit{download} do modelo foi realizado de forma automatizada utilizando a biblioteca \textit{Pooch} em ambiente \textit{Python}, com extração direta dos arquivos comprimidos.

O arquivo de dados, fornecido em formato texto (.txt), foi lido e convertido em um objeto \textit{DataArray} da biblioteca \textit{Xarray}, permitindo a manipulação eficiente do modelo de geóide em ambiente matricial. Em seguida, o modelo processado foi salvo em formato \textit{NetCDF} (.nc) para utilização nas etapas subsequentes do projeto.

\subsection{Consolidação das Bases de Dados Gravimétricos}

As bases de dados gravimétricos terrestres utilizadas no projeto estavam originalmente distribuídas em oito arquivos provenientes de diferentes instituições:

\begin{itemize}
    \item Serviço Geológico do Brasil (SGB/CPRM);
    \item Banco Nacional de Dados Gravimétricos (BNDG);
    \item Instituto Brasileiro de Geografia e Estatística (IBGE);
    \item Agência Nacional do Petróleo, Gás Natural e Biocombustíveis (ANP);
    \item Petróleo Brasileiro S.A. (Petrobras);
    \item Dados complementares organizados por Rodrigues (comunicação pessoal);
    \item Dados de anomalias gravimétricas por  \citet{Castro2015} (comunicação pessoal);
    \item Administración Nacional de Combustibles, Alcoholes y Portland (ANCAP).
\end{itemize}

Cada conjunto de dados foi carregado em um objeto \textit{DataFrame} do \textit{Pandas} e padronizado por meio de uma função de normalização desenvolvida especificamente para este fim. Esta função garantiu a uniformização das colunas essenciais, tais como longitude, latitude, \textit{easting}, \textit{northing}, altura geodésica, altura ortométrica, latitude esférica, raio e gravidade terrestre.

O conjunto de dados do IBGE exigiu tratamento adicional, devido à presença de valores numéricos armazenados como texto formatado com separadores de milhar e vírgula decimal. Uma rotina específica foi implementada para a conversão adequada desses valores para o formato numérico padrão.

Após a normalização, cada banco de dados foi complementado com informações de altura elipsoidal ou ortométrica faltantes, utilizando a ondulação do geóide obtida na etapa anterior. Para isso, o modelo \textit{"The South American gravimetric geoid: GEOID2021"} \citep{GEOID2021} foi interpolado empregando a metodologia \textit{Cubic} da biblioteca \textit{Verde}.

Em seguida, para cada base de dados:
\begin{itemize}
    \item As alturas elipsoidais foram completadas onde apenas a altura ortométrica estava disponível, e vice-versa;
    \item As coordenadas geográficas (longitude e latitude) foram reprojetadas em coordenadas planas (easting e northing);
    \item As latitudes esféricas e os raios geocêntricos foram calculados com base no elipsoide de referência GRS80 \citep{Moritz1980}.
\end{itemize}




Por fim, os diferentes bancos de dados foram integrados em um único conjunto, aplicando-se uma rotina de eliminação de duplicatas baseada em consultas de vizinhança utilizando árvores \textit{cKDTree} \citep{narasimhulu2021} da biblioteca \textit{SciPy}. Foram mantidos apenas os pontos cuja diferença de valores gravimétricos com seus vizinhos mais próximos fosse superior a 1 mGal, assegurando, assim, a qualidade e a independência das observações mantidas na base final.

Para cada estação gravimétrica, foi necessário também obter o valor correspondente do gradiente do potencial de gravidade fornecido pelo modelo geopotencial global GOCO06s. Para isso, o conjunto de estações foi dividido em partes menores, e foram geradas requisições para o serviço ICEGEM, utilizando as colunas de latitude, longitude e altura elipsoidal como parâmetros de entrada.

Após o download dos dados do GOCO06s, os valores de gravidade modelada foram incorporados ao banco de dados consolidado. Em seguida, o distúrbio de gravidade foi calculado como a diferença entre a gravidade observada e a gravidade normal teórica do elipsoide GRS80 \citep{Moritz1980}, obtida por meio da biblioteca \textit{Boule}.

Finalmente, foi realizada uma filtragem para a remoção de valores anômalos extremos, retendo apenas observações com distúrbio de gravidade superior a \(-150\) mGal. O banco de dados gravimétrico processado foi salvo em formato CSV, compondo a base final a ser utilizada nas etapas seguintes do estudo.

\subsection{Processamento do Modelo FABDEM}

O modelo de elevação utilizado para representar a topografia continental foi o \textit{Forest and Buildings removed Copernicus DEM (FABDEM)} \citep{fabdem}, obtido manualmente no repositório oficial da Universidade de Bristol. Os arquivos foram inicialmente reamostrados para uma resolução adequada ao escopo do projeto, utilizando interpolação bilinear com fator de reamostragem igual a 120. Em seguida, os dados foram organizados em mosaicos regionais, gerando submosaicos intermediários. Posteriormente, os submosaicos foram combinados para formar um mosaico final abrangendo toda a área de interesse. Para restringir o modelo às áreas continentais relevantes, aplicou-se um recorte espacial baseado em um shapefile.

Considerando que diferentes etapas do processamento exigem informações em distintos referenciais de altura, foram produzidas duas versões do modelo de elevação: uma versão ortométrica e outra elipsoidal. Para a conversão das altitudes, a ondulação do geóide \textit{EGM2008} \citep{egm2008} foi reinterpolada para coincidir com a resolução espacial do modelo de elevação. Essa reamostragem foi realizada utilizando o método \textit{Cubic} da biblioteca \textit{Verde}. A altitude elipsoidal foi então obtida pela soma da grade reinterpolada da ondulação do geóide à grade da altitude ortométrica previamente recortada. Ambas as versões, ortométrica e elipsoidal, foram salvas em formato \textit{NetCDF}.

\subsection{Processamento do Modelo SRTM15+}

Para representar a batimetria das áreas oceânicas adjacentes à área de estudo, foi utilizado o modelo \textit{SRTM15+} \citep{srtm15plus}, obtido em formato GeoTIFF. Inicialmente, os dados foram reamostrados utilizando interpolação bilinear com fator de reamostragem 8, de modo a compatibilizar sua resolução espacial com os demais conjuntos de dados utilizados no projeto. Após a reamostragem, os dados foram organizados em formato matricial, com as dimensões renomeadas para latitude e longitude e o sistema de referência geográfica mantido em EPSG:4326. A grade reamostrada foi salva em formato NetCDF, representando as altitudes ortométricas em relação ao geóide de referência.

Considerando que determinadas etapas do processamento requerem altitudes referenciadas ao elipsoide, foi também gerada uma versão elipsoidal do modelo. Para essa conversão, utilizou-se o modelo de ondulação do geóide \textit{EGM96} \citep{egm96}, compatível com o referencial do \textit{SRTM15+}. O modelo de geóide foi interpolado utilizando o método \textit{Cubic} da biblioteca \textit{Verde}, para coincidir com a resolução espacial do modelo de batimetria.

A conversão ortométrica para elipsoidal foi realizada pela adição da ondulação do geóide às altitudes ortométricas do \textit{SRTM15+}. O produto final resultou em duas versões do modelo batimétrico, ortométrica e elipsoidal, ambas salvas em formato NetCDF para integração às etapas posteriores da análise.

\subsection{Integração dos Modelos de Elevação}


Com o objetivo de obter um modelo contínuo de superfície que contemplasse tanto a topografia continental quanto a batimetria oceânica, foram integrados os modelos FABDEM e SRTM15+. O modelo FABDEM, por apresentar maior resolução e remoção de vegetação e edificações, foi adotado como base primária para as áreas continentais. No entanto, por não incluir dados batimétricos, tornou-se necessária sua complementação com o SRTM15+, que cobre as regiões oceânicas.

Como o modelo FABDEM já havia sido previamente recortado com base em um shapefile que delimita a área continental, a integração dos dois modelos foi implementada por meio de uma operação condicional. Utilizou-se a função \texttt{xarray.where}, de forma que, nas regiões onde os valores do FABDEM eram nulos (i.e., fora da área continental), os valores correspondentes do SRTM15+ fossem automaticamente incorporados. Esse procedimento foi aplicado de forma independente para as duas versões dos modelos de elevação:

\begin{itemize}
    \item A versão ortométrica, com altitudes referidas ao geóide;
    \item A versão elipsoidal, com altitudes referidas ao elipsoide de referência.
\end{itemize}

\noindent
O resultado foi a geração de dois mosaicos finais contínuos, um ortométrico e outro elipsoidal, ambos cobrindo toda a área de interesse, incluindo os ambientes continentais e oceânicos. Os produtos finais foram salvos em formato NetCDF para utilização nas etapas posteriores do projeto.

\subsection{Modelagem Gravimétrica por Prismas}

\subsubsection{Aplicação de filtro gaussiano à topografia}


Com o objetivo de separar componentes espectrais da topografia e permitir a modelagem de prismas voltada a diferentes escalas de variação espacial, foi aplicada uma filtragem passa-baixa do tipo gaussiana à superfície de elevação elipsoidal. Essa etapa teve como finalidade a suavização da topografia, por meio da atenuação progressiva de feições de alta frequência espacial, preservando apenas as variações de maior comprimento de onda.

A superfície utilizada como base para a filtragem foi o modelo de elevação elipsoidal mosaicado, obtido pela combinação dos modelos FABDEM e SRTM15+. Os dados foram previamente convertidos para altitudes referidas ao elipsoide e reprojetados para coordenadas planas (EPSG:5880), compatíveis com a modelagem por prismas em geometria cartesiana.

Foram aplicados dois filtros distintos, com diferentes comprimentos de onda de corte:
\begin{itemize}
    \item 20 km, para remoção de ruído topográfico e pequenos detalhes locais, preservando as variações associadas a estruturas crustais de pequena a média escala;
    \item 200 km, para eliminar as variações crustais mais rasas e obter uma topografia extremamente suavizada, voltada à modelagem de componentes de longa extensão lateral, como compensação isostática e espessura litosférica.
\end{itemize}

A filtragem foi realizada utilizando a função \texttt{gaussian\_lowpass} da biblioteca \textit{Harmonica}, com os comprimentos de onda convertidos de metros para graus, adotando-se uma equivalência aproximada de 30 metros por segundo de arco (\(1'' \approx 30 \text{m}\)). O resultado foi uma superfície suavizada, utilizada como entrada direta na definição da superfície superior dos prismas modelados nas subseções seguintes.

Perfeito, Eros — com base na sua orientação, aqui está a **versão revisada da subseção 5.6.2**, agora mais enxuta e focada, **evitando repetições** das seções anteriores e mantendo a objetividade acadêmica:


\subsubsection{Definição da superfície superior (topografia/batimetria)}

A superfície de topo da crosta, utilizada na modelagem gravimétrica, foi definida a partir da grade de elevação elipsoidal suavizada e reprojetada. Essa superfície foi empregada exclusivamente como limite superior dos prismas da camada crustal superior, representando a interface entre a crosta e a topografia ou batimetria regional.

Para o cálculo das espessuras das demais camadas geológicas, incluindo sedimentos, basaltos e a lâmina de água, foi utilizada a grade de elevação ortométrica, por ser referida ao nível do mar geoidal, compatível com os dados disponíveis para espessura sedimentar e modelos geológicos regionais. A definição da superfície superior de cada camada seguiu critérios geométricos específicos, detalhados nas subseções seguintes, considerando a presença de unidades sobrejacentes e o uso de máscaras vetoriais para delimitação espacial.

\subsubsection{Estimativa da base do embasamento}


A base do embasamento foi estimada a partir da diferença entre a superfície topográfica ortométrica e a espessura total de sedimentos. Para isso, foi realizada a combinação de três fontes principais de dados: as isópacas sedimentares do Mapa Tectônico da América do Sul, os dados do modelo CRUST1.0 e os valores do modelo global de espessura sedimentar da NOAA (GlobSed-v3).

Os dados vetoriais e matriciais foram integrados por meio de reprojeção, filtragem espacial e interpolação por \textit{spline}, precedida de redução por blocos com função mediana. Para garantir a coerência geométrica e evitar sobreposição excessiva de pontos, utilizou-se uma regra de exclusão baseada em distância mínima entre observações de diferentes bases.

Após a unificação, o conjunto combinado de espessuras sedimentares foi suavizado e interpolado sobre uma grade regular compatível com a superfície topográfica. A base do embasamento foi então obtida pela subtração da espessura total de sedimentos em relação à elevação ortométrica.

O modelo resultante foi posteriormente utilizado como limite inferior para as camadas sedimentares, e como limite superior para o embasamento cristalino e unidades vulcânicas sobrepostas, conforme detalhado nas subseções seguintes.

\subsubsection{Modelagem da Formação Serra Geral}


A Formação Serra Geral foi modelada com base em dois conjuntos de dados principais, isopacas de \citet{Zaln1990} e curvas de contorno estrutural de . 

As isópacas vetorizadas de \citet{Zaln1990} e as curvas de contorno estrutural vetorizadas de \citet{Arjo1999} tiveram seus vértices extraídos e reprojetados. Sobre esses vértices, aplicou-se uma redução de blocos por mediana com espaçamento de 10 km, utilizando a função \texttt{BlockReduce} da biblioteca \textit{Verde}, com o objetivo de reduzir a redundância espacial dos dados e minimizar o custo computacional da interpolação. Em seguida, dois interpoladores do tipo \textit{Spline} foram ajustados, um para os dados de base dos basaltos e outro para os dados de espessura, permitindo a geração de duas grades contínuas sobre a mesma malha regular: \textit{basalt\_base\_ort} e \textit{basalt\_isopachous}, respectivamente. Aplicou-se uma máscara espacial correspondente à área de ocorrência dos basaltos, restringindo ambas as grades aos limites geológicos da Formação Serra Geral. Por fim, usando operadores condicionais do \textit{xarray}(\texttt{xr.where}), valores negativos de espessura foram descartados, e a base dos basaltos foi limitada inferiormente pelo embasamento (\textit{basement\_orth}) e superiormente pela superfície topográfica (\textit{h\_orthometric}).



O topo preliminar da sequência basáltica (\textit{basalt\_top}), foi então obitido pela soma matricial da base  com a a espessura. Novamente, ajustes adicionais foram aplicados usando operadores condicionais (\texttt{xr.where}). Para as áreas de afloramento, o topo foi corrigido para coincidir com a superfície topográfica, e foram impostas condições geométricas para garantir a coerência: o topo dos basaltos nunca poderia ser inferior à base nem superior à superfície topográfica.

Posteriormente, a interface entre os basaltos e os sedimentos sobrejacentes foi estimada utilizando uma máscara vetorial específica para a cobertura sedimentar acima dos basaltos. A espessura dos sedimentos sobrejacentes foi calculada como a diferença entre a superfície topográfica ortométrica e o topo refinado dos basaltos. Novamente, valores negativos foram descartados.

Por fim, o teto dos basaltos (\textit{basalt\_roof}) foi reestimado: nas regiões onde sedimentos sobrejacentes estão presentes, o teto foi ajustado pela subtração da espessura sedimentar; nas regiões de afloramento, manteve-se a superfície topográfica. A espessura final dos basaltos foi obtida pela diferença entre o teto (\textit{basalt\_roof}) e a base (\textit{basalt\_base\_ort}), garantindo que apenas valores positivos fossem considerados.




A partir da base dos basaltos previamente modelada (\textit{basalt\_base\_ort}) e da espessura interpolada (\textit{basalt\_isopachous}), foi obtido o topo preliminar da sequência basáltica (\textit{basalt\_top}). Para as áreas de afloramento, o topo foi corrigido para coincidir com a superfície topográfica ortométrica (\textit{h\_orthometric}). Foram impostas condições geométricas para garantir a coerência: o topo dos basaltos nunca poderia ser inferior à base nem superior à superfície topográfica.




















A camada de prismas representando a Formação Serra Geral foi definida entre o topo e a base dos basaltos. O topo foi obtido a partir da superfície topográfica ortométrica nas regiões de afloramento, ou interpolado a partir dos dados de espessura e base em áreas cobertas por sedimentos. A coerência geométrica foi garantida impondo-se as seguintes condições: o topo nunca é inferior à base, e ambos estão contidos entre a superfície topográfica e o embasamento cristalino.

As regiões cobertas pelos basaltos foram definidas por máscaras vetoriais específicas, e os dados foram recortados e interpolados sobre a grade regular da área de estudo. O modelo resultante foi reprojetado para o sistema de coordenadas projetadas e utilizado na definição de duas camadas prismáticas: uma correspondente à base dos basaltos e outra ao seu topo (ou teto), servindo como limite para o empilhamento das demais unidades sedimentares e vulcânicas.




: as isópacas de \citet{Zaln1990}, representando a espessura dos derrames basálticos, e o contorno estrutural do topo do Aquífero Guarani publicado por \citep{Arjo1999}, utilizado como aproximação para a base dos basaltos. Ambos os conjuntos foram vetorizados manualmente a partir de figuras originais, seguidos de reprojeção e interpolação por \textit{spline} com redução prévia por blocos.







uma máscara espacial correspondente à área de ocorrência dos basaltos



Por fim, foram aplicadas restrições topológicas para garantir a consistência física da superfície interpolada. Em cada célula da grade, a base dos basaltos foi limitada inferiormente pelo embasamento e superiormente pela superfície topográfica, assegurando que a sequência vulcânica não ultrapassasse limites geológicos plausíveis. Essas correções foram implementadas com operadores condicionais do \textit{xarray}, preservando apenas os valores internamente coerentes.




Em seguida, aplicou-se uma máscara espacial correspondente à área de ocorrência dos basaltos, assegurando que a espessura interpolada fosse restringida aos limites geológicos da Formação Serra Geral. Valores negativos de espessura foram descartados.

A partir da base dos basaltos previamente modelada (\textit{basalt\_base\_ort}) e da espessura interpolada (\textit{basalt\_isopachous}), foi obtido o topo preliminar da sequência basáltica (\textit{basalt\_top}). Para as áreas de afloramento, o topo foi corrigido para coincidir com a superfície topográfica ortométrica (\textit{h\_orthometric}). Foram impostas condições geométricas para garantir a coerência: o topo dos basaltos nunca poderia ser inferior à base nem superior à superfície topográfica.

Posteriormente, a interface entre os basaltos e os sedimentos sobrejacentes foi estimada utilizando uma máscara vetorial específica para a cobertura sedimentar acima dos basaltos. A espessura dos sedimentos sobrejacentes foi calculada como a diferença entre a superfície topográfica ortométrica e o topo refinado dos basaltos. Novamente, valores negativos foram descartados.

Por fim, o teto dos basaltos (\textit{basalt\_roof}) foi reestimado: nas regiões onde sedimentos sobrejacentes estão presentes, o teto foi ajustado pela subtração da espessura sedimentar; nas regiões de afloramento, manteve-se a superfície topográfica. A espessura final dos basaltos foi obtida pela diferença entre o teto (\textit{basalt\_roof}) e a base (\textit{basalt\_base\_ort}), garantindo que apenas valores positivos fossem considerados.









sobre a malha regular da área de interesse.


Em seguida, os dados reduzidos foram interpolados com um modelo \textit{Spline}, também da biblioteca \textit{Verde}, resultando em uma superfície contínua da base dos basaltos (\textit{basalt\_base\_ort}) ajustada sobre a malha regular da área de estudo. 

A partir dos dados reduzidos, foi ajustado um interpolador do tipo \textit{Spline}, também utilizando \textit{Verde}, que permitiu a geração de uma grade contínua de espessura dos basaltos (\textit{basalt isopachous}) sobre a malha regular da área de interesse. 


A grade interpolada foi reamostrada para coincidir com a resolução do modelo do embasamento cristalino, garantindo a coerência geométrica entre as superfícies estruturais.





A base da Formação Serra Geral foi estimada a partir dos dados vetorizados do contorno estrutural do topo do Aquífero Guarani, conforme publicado por Araujo et al. (1999), considerado neste trabalho como aproximação para a interface inferior dos basaltos. 

As curvas de contorno estrutural de \citet{Arjo1999} tiveram os seus vertices extraidos.

Aplicou-se uma redução de blocos por mediana com espaçamento de 10 km, utilizando a função \texttt{BlockReduce} da biblioteca \textit{Verde}. Essa etapa visou diminuir o custo computacional da interpolação, diminuir a redundância espacial dos dados.

















Inicialmente, as isópacas vertorizadas de \citep{Zaln1990} tiveram os seus vertices extraidos,  

os pontos amostrados contendo espessura de derrames basálticos (dados de Zalan et al., 1987) foram submetidos a uma redução de blocos utilizando a função \texttt{BlockReduce} da biblioteca \textit{Verde}, com espaçamento de 10 km. Esse procedimento consistiu em agrupar os pontos dentro de blocos regulares e calcular o valor mediano da espessura em cada bloco, reduzindo assim o ruído associado à superdensidade de observações em certas regiões.

A partir dos dados reduzidos, foi ajustado um interpolador do tipo \textit{Spline}, também utilizando \textit{Verde}, que permitiu a geração de uma grade contínua de espessura dos basaltos (\textit{basalt isopachous}) sobre a malha regular da área de interesse. 


Esta grade foi reamostrada para coincidir com a grade de referência do embasamento cristalino (\textit{basement\_orth}), garantindo a compatibilidade geométrica entre os diferentes modelos.


= Resultados parciais 

Resultados parciais demonstram que a utilização de validação cruzada k-fold permitiu a definição de parâmetros ótimos, como profundidade e damping, para a interpolação dos dados por fontes equivalentes. Com base nesses parâmetros, foram interpoladas as diferenças entre os dados terrestres e satelitais, resultando em um produto preliminar que combina robustez estatística e alta resolução espacial.

= Discussão

Dado o estágio atual da pesquisa, os métodos já implementados revelam-se robustos e promissores para a conclusão do projeto, destacando-se a exequibilidade técnica e operacional das etapas subsequentes. Espera-se que a continuidade deste trabalho contribua significativamente para o entendimento das características estruturais e geodinâmicas da região estudada, oferecendo subsídios relevantes para futuras investigações geológicas e geofísicas.

#bibliography(
  "works.bib",
  title: auto,
  full: false,
  style: "associacao-brasileira-de-normas-tecnicas"
  )