# Instalação e ativação manual do Office 2021

Transcrição organizada dos passos fornecidos. Estes comandos destinam-se ao Office Professional Plus 2021 com licenciamento por volume; não são instruções para Microsoft 365 nem para todas as edições do Office. A chave genérica e a instalação de ficheiros de licença não concedem uma licença de utilização. Utiliza KMS apenas com licenciamento e servidor autorizados.

## 1 — Instalar o Office com a ferramenta oficial

### Passo 1.1 — Criar a pasta de instalação

Cria uma pasta chamada `Office2021` dentro de `C:\programas`. Neste guia, usamos:

```text
C:\programas\Office2021
```

Esta pasta guarda os ficheiros de preparação; a localização das aplicações é definida pela instalação.

### Passo 1.2 — Copiar e extrair os ficheiros

Copia para essa pasta:

- `config.xml`;
- `officedeploymenttool_20326-20112.exe`, obtido no site oficial da Microsoft.

Executa o ficheiro do Office Deployment Tool, aceita os termos e escolhe `C:\programas\Office2021` como destino da extração. Este passo cria o ficheiro **`setup.exe`**, necessário para instalar o Office. Mantém o teu `config.xml` na mesma pasta.

O número no nome do Deployment Tool pode variar consoante a versão descarregada. O `config.xml` deve definir o produto, canal, idiomas e arquitetura pretendidos; o seu conteúdo não foi verificado neste guia.

### Passo 1.3 — Abrir o CMD como administrador

Abre o menu Iniciar, pesquisa por **cmd**, seleciona **Executar como administrador** e confirma o pedido de permissões.

Navega até à pasta:

```cmd
cd /d "C:\programas\Office2021"
```

### Passo 1.4 — Iniciar a instalação

Executa:

```cmd
setup.exe /configure config.xml
```

**Existe um espaço entre `setup.exe` e `/configure`.** Não uses `setup.exe/configure config.xml`.

Mantém a ligação à Internet se os ficheiros de instalação ainda precisarem de ser descarregados.

### Passo 1.5 — Aguardar a conclusão

Espera até a instalação terminar. Se o XML configurar uma instalação silenciosa, pode não aparecer uma janela de progresso. Quando o comando terminar, confirma que o Word ou Excel aparece no menu Iniciar antes de prosseguir.

A instalação com a ferramenta oficial não inclui, por si só, uma licença de utilização.

## 2 — Ativação manual

## Passo 2.1 — ABRIR O CMD COMO ADMINISTRADOR

1. Abre o menu Iniciar e pesquisa por cmd.
2. Seleciona Executar como administrador.
3. Confirma o pedido de permissões.
4. Executa os comandos seguintes individualmente, carregando em Enter após cada linha.

## Passo 2.2 — ENTRAR NA PASTA DO OFFICE

Experimenta primeiro:

```cmd
cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16"
```

Se o caminho não existir, experimenta:

```cmd
cd /d "%ProgramFiles%\Microsoft Office\Office16"
```

A localização depende da arquitetura e do tipo de instalação do Office. Confirma que o ficheiro ospp.vbs existe na pasta escolhida:

```cmd
dir ospp.vbs
```

Se nenhum dos caminhos existir, localiza a instalação antes de continuar.

## Passo 2.3 — INSTALAR OS FICHEIROS DE LICENÇA DE VOLUME

Apenas para uma instalação correspondente ao Office Professional Plus 2021 e com direito a licenciamento por volume:

```cmd
for /f %x in ('dir /b ..\root\Licenses16\ProPlus2021VL_KMS*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%x"
```

Este comando utiliza os ficheiros locais .xrm-ms. A sua instalação não atribui uma licença comercial e não é um passo universalmente necessário se a edição de volume já estiver corretamente instalada.

Nota: no CMD interativo usa %x. Se colocares o comando num ficheiro .bat ou .cmd, usa %%x nas duas ocorrências.

## Passo 2.4 — CONFIGURAR E SOLICITAR A ATIVAÇÃO

O procedimento fornecido contém estes comandos:

```cmd
cscript ospp.vbs /setprt:1688
cscript ospp.vbs /unpkey:6F7TH >nul
cscript ospp.vbs /inpkey:FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH
cscript ospp.vbs /sethst:209.209.9.214
cscript ospp.vbs /act
```

O comando /unpkey remove a chave instalada que termina em 6F7TH. O redirecionamento >nul oculta a mensagem desse comando; remove-o se precisares de diagnosticar um erro.

O endereço 209.209.9.214 foi reproduzido do texto fornecido. Não foi verificada a sua disponibilidade, propriedade ou autorização para o teu licenciamento. Para utilização numa organização, substitui-o pelo endereço do servidor KMS autorizado indicado pelo administrador.

É necessário acesso ao servidor configurado, que pode exigir rede interna ou VPN, e não apenas ligação à Internet.

## Passo 2.5 — CONFIRMAR O RESULTADO

Executa:

```cmd
cscript ospp.vbs /dstatus
```

Verifica o estado da licença correspondente ao produto pretendido. Abre também o Word ou Excel e consulta Ficheiro > Conta > Informações do Produto.

Uma mensagem Product activation successful indica sucesso da tentativa para o produto listado. Não comprova, por si só, que existe uma licença válida de utilização. A ativação KMS requer renovação periódica.

## Erro `0xC004F074`

Este erro pode indicar que não foi possível contactar um serviço KMS adequado. Não significa necessariamente Internet instável ou servidor ocupado.

Verifica:

- Endereço e disponibilidade do servidor autorizado.
- Ligação à rede interna ou VPN, quando necessária.
- Data e hora do computador.
- Acesso à porta TCP configurada, normalmente 1688.
- Compatibilidade da edição instalada e configuração do servidor.

Se o erro persistir, guarda a mensagem completa e contacta o administrador. Repetir /act indefinidamente não resolve uma configuração incorreta.

## Documentação oficial

[Office Deployment Tool — instalação e configuração](https://learn.microsoft.com/en-us/microsoft-365-apps/deploy/overview-office-deployment-tool)

[Ferramentas para gerir a ativação por volume do Office](https://learn.microsoft.com/en-us/office/volume-license-activation/tools-to-manage-volume-activation-of-office)

Nota: este ficheiro contém instruções; não executa comandos automaticamente.
