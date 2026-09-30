# 🖥️ Activador Windows 11 — by chocoflakez

Script em **Batch (`.bat`)** que tenta ativar edições compatíveis do Windows 11 através de servidores KMS, testando diferentes servidores automaticamente.

> As chaves genéricas não constituem uma licença. A ativação KMS destina-se a cenários de licenciamento por volume autorizados e não suporta o Windows 11 Home.

## 🚀 Como usar

1. Descarrega o ficheiro disponível na pasta `src/`.
2. Clica com o botão direito em `activador-windows-11-chocoflakez.bat`.
3. Seleciona **Executar como administrador**.
4. Acompanha as mensagens apresentadas durante a execução.

O comportamento final depende da versão do script utilizada: poderá apresentar uma opção de reinício ou terminar com uma mensagem de resultado.

## 📖 Alternativa manual — opcional

Se o Batch não funcionar, consulta o ficheiro **[`manual-activation.txt`](manual-activation.txt)**, que contém o passo a passo opcional para a tentativa de ativação manual.

A alternativa manual não dispensa uma licença válida nem garante que a ativação seja bem-sucedida.

## 📁 Estrutura do repositório

```text
activador-windows11/
├── src/
│   └── activador-windows-11-chocoflakez.bat
├── manual-activation.txt
└── README.md
```

## 🛠️ Como funciona

1. Tenta instalar chaves de produto genéricas.
2. Configura um servidor KMS.
3. Solicita a ativação do Windows.
4. Se a tentativa falhar, testa outro servidor.
5. Apresenta uma mensagem com o resultado.

## 📌 Requisitos

- Edição do Windows 11 compatível com ativação KMS.
- Licenciamento por volume válido e acesso a um servidor KMS autorizado.
- Permissões de administrador.
- Ligação ao servidor utilizado.

## ⚠️ Limitações e cuidados

- A disponibilidade dos servidores não é garantida.
- Scripts antigos que dependem de `wmic` podem falhar em versões recentes do Windows.
- A procura de mensagens em inglês pode interpretar incorretamente resultados num Windows em português.
- Algumas versões do script removem a chave instalada antes de tentar instalar outra. Revê o código antes de executar.
- Não ignores alertas da Segurança do Windows sem verificar a deteção.
- Uma indicação de sucesso do script não comprova a existência de uma licença válida.

Para ativação com uma licença pessoal ou OEM, utiliza **Definições → Sistema → Ativação**.

## 📜 Licença

Este projeto é disponibilizado sob a licença MIT. Consulta o ficheiro `LICENSE` do repositório para conhecer os termos completos.

---

✉️ **Autor:** chocoflakez  
📅 **Última atualização do README:** Setembro de 2026
