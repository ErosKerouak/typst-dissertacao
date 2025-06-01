// --- Estilos tipográficos gerais da dissertação ---

// 1) Estilo do corpo do texto
#set text(
  font: "New Computer Modern",  // Fonte serifada acadêmica
  size: 12pt                // Tamanho padrão para dissertação
)

// 2) Espaçamento entre linhas (par = "parágrafo")
#set par(
  leading: 1.5em            // Espaçamento de 1.5 linhas
)

// 3) Controle de numeração estrutural dos títulos
#set heading(
  numbering: "1.1"          // 1, 1.1, 1.1.1 etc.
)

// 4) Estilo visual dos títulos (fonte, tamanho e peso)
#show heading: set text(
  size: 14pt,               // Título um pouco maior que o corpo
  weight: "bold"            // Negrito
)
