# Automação de Infraestrutura com Terraform e GitHub Actions

Este repositório demonstra como automatizar a criação de infraestruturas usando ferramentas de Infrastructure as Code (IaC) como o Terraform, integrando com pipelines no GitHub Actions.

## Visão Geral

O objetivo deste projeto é provisionar recursos na AWS, como buckets S3 para sites estáticos, utilizando o Terraform e automatizando o processo através de workflows no GitHub Actions.

## Estrutura do Repositório

- `terraform/`: Contém os arquivos de configuração do Terraform.
  - `s3-bucket-static/`: Configurações específicas para criar um bucket S3 para hospedar um site estático.
- `provision-s3-static-site.yaml`: Workflow do GitHub Actions para automatizar a criação do bucket S3.

## Pré-requisitos

- Conta na AWS
- Chaves de acesso da AWS (Access Key ID e Secret Access Key)
- Repositório no GitHub
- Terraform instalado

## Configuração

1. Clone este repositório:
    ```sh
    git clone https://github.com/seu-usuario/seu-repositorio.git
    cd seu-repositorio
    ```

2. Configure as credenciais da AWS no GitHub:
    - Vá para as configurações do repositório no GitHub.
    - Adicione os segredos `AWS_ACCESS_KEY_ID` e `AWS_SECRET_ACCESS_KEY` com suas respectivas chaves de acesso.

3. Ajuste a região da AWS no arquivo `main.tf` se necessário:
    ```hcl
    provider "aws" {
        region = "sa-east-1"
    }
    ```

## Uso

1. Abra uma nova issue no repositório do GitHub com o título contendo o nome do bucket S3 desejado.
2. O workflow do GitHub Actions será acionado automaticamente, criando o bucket S3 e configurando-o para hospedar um site estático.

## Estrutura do Workflow

O arquivo `provision-s3-static-site.yaml` define o workflow do GitHub Actions:
- Faz o checkout do repositório.
- Configura a CLI da AWS.
- Extrai o nome do bucket a partir do título da issue.
- Executa o Terraform para criar o bucket S3.
- Adiciona um comentário na issue informando que o bucket foi criado com sucesso.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests.

## Licença

Este projeto está licenciado sob a MIT License.
