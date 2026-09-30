# Ativação manual do Windows 11

Alternativa opcional quando o ficheiro Batch não funciona.

## Requisitos

- Permissões de administrador.
- Chave válida para a edição instalada ou licença de volume válida.
- Para KMS: edição compatível e acesso ao servidor autorizado da organização. Windows 11 Home não suporta este método.

As chaves genéricas de cliente KMS não constituem uma licença. Não se deve usar uma chave de outra edição nem instalar várias chaves sucessivamente.

## 1. Abrir a Linha de Comandos como administrador

1. Abre o menu Iniciar e escreve `cmd`.
2. Seleciona **Executar como administrador**.
3. Confirma o pedido de permissões.

Executa os comandos seguintes um de cada vez, carregando em **Enter** após cada linha. Os campos entre `<>` são exemplos: substitui-os pelos valores corretos, sem os sinais `<` e `>`.

## 2. Instalar a chave correspondente à edição

```cmd
cscript //nologo "%windir%\System32\slmgr.vbs" /ipk <CHAVE-DA-EDICAO>
```

Para uma licença pessoal, utiliza a tua chave válida. Num ambiente de volume, utiliza a chave de cliente KMS indicada pela organização para essa edição.

Aguarda a confirmação de instalação da chave. Se aparecer um erro, resolve-o antes de continuar. Não é necessário desinstalar previamente a chave com `/upk`.

## 3. Configurar o servidor KMS — apenas para licenciamento por volume

Se utilizas uma licença pessoal ou OEM, salta este passo.

```cmd
cscript //nologo "%windir%\System32\slmgr.vbs" /skms <SERVIDOR-KMS-AUTORIZADO>:1688
```

Obtém o endereço junto do administrador da organização. Pode ser necessário ligar à rede interna ou à VPN. Em redes com descoberta automática de KMS, a configuração manual pode ser desnecessária.

## 4. Solicitar a ativação

```cmd
cscript //nologo "%windir%\System32\slmgr.vbs" /ato
```

Lê a mensagem completa. Uma falha deve ser analisada pelo código apresentado; não significa necessariamente que a Internet esteja instável.

### Erro 0xC004F074

Este erro pode indicar que não foi possível contactar um serviço KMS adequado. Verifica o endereço do servidor autorizado, a ligação à rede/VPN, a data e hora e o acesso à porta TCP 1688. Se persistir, contacta o administrador com o código e a mensagem completa.

## 5. Confirmar o estado

Abre **Definições → Sistema → Ativação**, ou executa:

```cmd
cscript //nologo "%windir%\System32\slmgr.vbs" /dlv
cscript //nologo "%windir%\System32\slmgr.vbs" /xpr
```

Confirma a edição, o estado da licença e, quando aplicável, a validade da ativação. Uma ativação KMS necessita de renovação periódica e não equivale a uma licença permanente.

## Remover um servidor KMS configurado manualmente

```cmd
cscript //nologo "%windir%\System32\slmgr.vbs" /ckms
```

Este comando remove o endereço configurado e restaura a descoberta automática. Não reinstala uma chave removida nem converte uma licença de volume numa licença pessoal.

## Documentação oficial

- [Comandos Slmgr.vbs](https://learn.microsoft.com/pt-pt/windows-server/get-started/activation-slmgr-vbs-options)
- [Chaves de cliente KMS e edições compatíveis](https://learn.microsoft.com/en-us/windows-server/get-started/kms-client-activation-keys)
- [Ativação do Windows](https://support.microsoft.com/pt-pt/windows/activation/activate-windows)

Última atualização: setembro de 2026.
