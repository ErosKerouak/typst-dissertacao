// --- Configuração de layout da página da dissertação ---
// Define margens, estilo de numeração de páginas e placeholders para cabeçalho/rodapé.

#set page(
  // Usa o tamanho padrão da página A4 (210 × 297 mm)
  width: auto,
  height: auto,

  // Margens acadêmicas típicas (padrão ABNT)
  margin: (
    top: 3cm,      // Margem superior
    bottom: 2.5cm, // Margem inferior
    left: 3cm,     // Margem esquerda (encadernação)
    right: 2cm     // Margem direita
  ),

  // Numeração automática no rodapé direito
  numbering: "arabic",

  // Cabeçalho vazio (pode ser preenchido em outro módulo depois)
  header: [],

  // Rodapé vazio (apenas numeração automática será exibida)
  footer: [],
)
