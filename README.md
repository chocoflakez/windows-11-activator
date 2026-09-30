# 🖥️ Activador Windows 11 e guia de instalação do Office — by chocoflakez

Script em **Batch (`.bat`)** que tenta ativar edições compatíveis do Windows 11 através de servidores KMS, testando diferentes servidores automaticamente. O repositório inclui também guias manuais para a ativação do Windows e para a instalação e ativação do Office 2021.

> As chaves genéricas não constituem uma licença. A ativação KMS destina-se a cenários de licenciamento por volume autorizados e não suporta o Windows 11 Home.

## 🚀 Como usar o Batch do Windows

1. Descarrega o ficheiro disponível na pasta `src/`.
2. Clica com o botão direito em `activador-windows-11-chocoflakez.bat`.
3. Seleciona **Executar como administrador**.
4. Acompanha as mensagens apresentadas durante a execução.

O comportamento final depende da versão do script utilizada: poderá apresentar uma opção de reinício ou terminar com uma mensagem de resultado.

## 📖 Guias manuais

### Windows 11 — alternativa opcional

Se o Batch não funcionar, consulta **[manual-activation.md](manual-activation.md)**. O guia explica como abrir o CMD como administrador, configurar a ativação manual e verificar o resultado.

A alternativa manual não dispensa uma licença válida nem garante que a ativação seja bem-sucedida.

### Office 2021 — instalação e ativação manual

Consulta **[manual-activation-office2021.md](manual-activation-office2021.md)** para seguir o procedimento completo, começando pela instalação com o **Office Deployment Tool** oficial da Microsoft.

O guia inclui:

1. Criar a pasta `C:\programas\Office2021`.
2. Copiar o `config.xml` e o executável do Office Deployment Tool para essa pasta.
3. Extrair o Deployment Tool para obter o `setup.exe`.
4. Abrir o CMD como administrador e navegar até à pasta.
5. Executar `setup.exe /configure config.xml` e aguardar a conclusão da instalação.
6. Seguir os passos de ativação por volume e confirmar o estado da licença.

O conteúdo do `config.xml` determina a edição, o canal, os idiomas e a arquitetura instalados. O guia de ativação destina-se ao **Office Professional Plus 2021 com licenciamento por volume**; não se aplica a todas as edições do Office nem ao Microsoft 365.

A instalação através da ferramenta oficial não inclui, por si só, uma licença. Para ativação KMS, utiliza um servidor autorizado para o teu licenciamento.

## 📁 Estrutura do repositório

- `src/activador-windows-11-chocoflakez.bat` — script de ativação do Windows.
- `manual-activation.md` — guia de ativação manual do Windows.
- `manual-activation-office2021.md` — guia de instalação e ativação manual do Office 2021.
- `README.md` — apresentação e instruções gerais.

## 🛠️ Como funciona o Batch do Windows

1. Tenta instalar chaves de produto genéricas.
2. Configura um servidor KMS.
3. Solicita a ativação do Windows.
4. Se a tentativa falhar, testa outro servidor.
5. Apresenta uma mensagem com o resultado.

O Batch do Windows não instala nem ativa o Office; esse procedimento está documentado no guia manual indicado acima.

## 📌 Requisitos

### Windows

- Edição do Windows 11 compatível com ativação KMS.
- Licenciamento por volume válido e acesso a um servidor KMS autorizado.
- Permissões de administrador.
- Ligação ao servidor utilizado.

### Office 2021

- Office Deployment Tool obtido no site oficial da Microsoft.
- Ficheiro `config.xml` adequado ao produto e à instalação pretendidos.
- Permissões de administrador.
- Ligação à Internet para descarregar os ficheiros de instalação, quando necessário.
- Para o procedimento KMS: edição de volume correspondente, licenciamento válido e acesso a um servidor autorizado.

## ⚠️ Limitações e cuidados

- A disponibilidade dos servidores não é garantida.
- Scripts antigos que dependem de `wmic` podem falhar em versões recentes do Windows.
- A procura de mensagens em inglês pode interpretar incorretamente resultados num Windows em português.
- Algumas versões do script removem a chave instalada antes de tentar instalar outra. Revê o código antes de executar.
- Não ignores alertas da Segurança do Windows sem verificar a deteção.
- Uma indicação de sucesso do script não comprova a existência de uma licença válida.
- As chaves genéricas e os ficheiros de licença do Office não atribuem uma licença de utilização.

Para ativação do Windows com uma licença pessoal ou OEM, utiliza **Definições → Sistema → Ativação**.

## 📜 Licença

Este projeto é disponibilizado sob a licença MIT. Consulta o ficheiro `LICENSE` do repositório para conhecer os termos completos.

A licença MIT do projeto não concede direitos de utilização do Windows ou do Office.

---

✉️ **Autor:** chocoflakez  
📅 **Última atualização do README:** Setembro de 2026
