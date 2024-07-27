# Infraestrutura Automatizada com Terraform e Ansible

Este projeto configura uma infraestrutura na AWS utilizando Terraform e Ansible para automatizar a configuração de servidores EC2 e a instalação de software básico, incluindo Nginx para servir uma página web estática.

## Tecnologias Utilizadas

- Terraform
- Ansible
- Nginx
- GitHub Actions
- AWS EC2
- Ubuntu LTS

## Como Instalar e Usar o Projeto

### Pré-requisitos

- Conta na AWS com permissões para criar recursos (EC2, VPC, Security Groups, etc.).
- Chave SSH configurada na AWS.
- Terraform instalado na máquina local.
- Ansible instalado na máquina local.
- GitHub Actions configurado com os seguintes secrets:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`
  - `ANSIBLE_PRIVATE_KEY`
  - `ANSIBLE_HOST`
  - `ANSIBLE_USER`

### Passos para Instalação

1. Clone o repositório:

    ```sh
    git clone https://github.com/JeffesonG/teste-Intelitrader
    cd teste-Intelitrader
    ```

2. Inicialize o Terraform e aplique a configuração:

    ```sh
    cd terraform
    terraform init
    terraform apply -auto-approve
    ```

3. Obtenha o IP público da instância EC2 criada e adicione-o aos secrets do GitHub (`ANSIBLE_HOST`).

4. Atualize o inventário do Ansible com o IP público da instância EC2:

    ```sh
    echo "[webservers]" > ansible/inventory
    echo "web ansible_host=<IP_PUBLICO> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/my-key-pair.pem" >> ansible/inventory
    ```

5. Execute o playbook do Ansible:

    ```sh
    cd ansible
    ansible-playbook -i inventory playbook.yml
    ```

### Automatização com GitHub Actions

O repositório está configurado para usar GitHub Actions para automatizar a infraestrutura e configuração do servidor. Cada push na branch `main` acionará o workflow de CI/CD definido em `.github/workflows/main.yml`.




>  This is a challenge by [Coodesh](https://coodesh.com/)
