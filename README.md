
---

````markdown
# Template Typst para Dissertação 

Este repositório contém um template modular, limpo e versionado para escrever dissertações acadêmicas utilizando [Typst](https://typst.app), uma linguagem de marcação tipográfica moderna.

O objetivo é oferecer uma alternativa leve e clara ao LaTeX, com separação de estilos, lógica e conteúdo em módulos independentes. Ideal para quem quer manter sua dissertação bem estruturada e versionada com Git.

---

## 🗂 Estrutura do Projeto

```bash
typst-dissertacao/
├── src/                 # Arquivos-fonte do documento
│   ├── main.typ         # Arquivo principal da dissertação
│   ├── config.typ       # Metadados: título, autor, instituição etc.
│   ├── layout.typ       # Margens, página, rodapé
│   ├── estilo.typ       # Tipografia e aparência dos títulos
│   ├── comandos.typ     # Funções reutilizáveis: caixas, teoremas, etc.
│   ├── test_*.typ       # Arquivos de teste para módulos isolados
│   └── capitulos/       # (opcional) Capítulos organizados separadamente
├── figuras/             # Imagens e gráficos utilizados
├── refs/                # Bibliografia (futura integração)
├── output/              # PDFs gerados pelo compilador
├── environment.yml      # Definição do ambiente Conda
├── Makefile             # Compilação automatizada (futuro)
└── .gitignore           # Exclusão de arquivos desnecessários no versionamento
````

---

## Como usar

1. **Clone o repositório**:

```bash
git clone https://github.com/eroskerouak/typst-dissertacao.git
cd typst-dissertacao
```

2. **Crie o ambiente Conda**:

```bash
conda env create -f environment.yml
conda activate typst-dissertacao
```

3. **Compile o documento**:

```bash
typst compile src/main.typ output/dissertacao.pdf
```

---

## Módulos principais

* **`config.typ`** — Define variáveis como `titulo`, `autor`, `instituicao`, etc.
* **`layout.typ`** — Define margens da página e ativa numeração automática.
* **`estilo.typ`** — Define fonte padrão, espaçamento de parágrafos e estilo dos títulos.
* **`comandos.typ`** — Define funções úteis para caixas, definições, teoremas e notas.
* **`main.typ`** — Importa os módulos e organiza o conteúdo da dissertação.

---

## Requisitos

* [Typst CLI](https://typst.app/docs/cli/install/)
* Conda ou Mamba (opcional, mas recomendado)

---

## 🛠 Em desenvolvimento

* [ ] Integração com bibliografia `.bib` via conversão
* [ ] Templates de capítulos (`introducao.typ`, `metodologia.typ` etc.)
* [ ] Capa e folha de aprovação configuráveis
* [ ] Makefile com alvos úteis (`make pdf`, `make clean`, etc.)

---

## Licença

Este projeto está licenciado sob a licença MIT. Você pode usá-lo, modificar e distribuir como quiser. Se for útil no seu trabalho, sinta-se à vontade para dar créditos ou fazer um fork.

---

## Autor

**Eros K. Cordeiro Pereira**
Mestrando em Geofísica – UFPR / LPGA
Repositório mantido com fins acadêmicos e de aprendizado.

---
