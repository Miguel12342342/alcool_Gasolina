# ⛽ Gasolina ou Álcool? (O Analisador de Combustível) 💡

## ✨ Sobre o Projeto

Este é um aplicativo desenvolvido para ajudar o usuário a tomar a decisão mais econômica no momento de abastecer o veículo flex. O projeto realiza um cálculo simples, mas essencial, comparando o preço da gasolina com o preço do álcool (etanol) para determinar qual combustível oferece o melhor custo-benefício, considerando o rendimento médio do etanol (que geralmente é 70% do rendimento da gasolina).

## 💡 Como Funciona o Cálculo

A regra de ouro para carros flex é que o álcool só é vantajoso se o seu preço for **menor ou igual a 70%** do preço da gasolina.

O aplicativo realiza o seguinte cálculo:

$$
\text{Preço Máximo Vantajoso do Álcool} = \text{Preço da Gasolina} \times 0.70
$$

Onde:
* Se **Preço do Álcool** $\le$ **Preço Máximo Vantajoso**, o resultado é **Álcool**.
* Se **Preço do Álcool** $>$ **Preço Máximo Vantajoso**, o resultado é **Gasolina**.

## 🛠️ Tecnologias Utilizadas

Liste aqui as tecnologias que você utilizou para desenvolver o aplicativo (Exemplos):

* **Linguagem de Programação:** Dart
* **Framework/Biblioteca:** React Native / Flutter / Android Studio / etc.
* **Interface de Usuário:** HTML, CSS

## ⚙️ Instalação e Execução (Para Desenvolvedores)

Siga os passos abaixo para ter uma cópia do projeto rodando em sua máquina local para fins de desenvolvimento e teste.

### Pré-requisitos

* Node.js (ou a tecnologia base do seu projeto)
* Git

### Passos

1.  **Clone o Repositório:**
    ```bash
    git clone [https://github.com/SeuUsuario/NomeDoSeuProjeto.git](https://github.com/SeuUsuario/NomeDoSeuProjeto.git)
    ```

2.  **Entre na Pasta do Projeto:**
    ```bash
    cd NomeDoSeuProjeto
    ```

3.  **Instale as Dependências (se houver):**
    ```bash
    npm install
    ```
    *ou*
    ```bash
    pip install -r requirements.txt
    ```

4.  **Execute o Aplicativo:**
    ```bash
    npm start
    ```
    *ou*
    ```bash
    python app.py
    ```

## 🤝 Contribuição

Contribuições são o que tornam a comunidade de código aberto um lugar incrível para aprender, inspirar e criar. Qualquer contribuição que você fizer será **muito apreciada**.

1.  Faça um Fork do Projeto.
2.  Crie um Branch para sua Feature (`git checkout -b feature/NovaFeature`).
3.  Faça o Commit das suas alterações (`git commit -m 'Adiciona NovaFeature'`).
4.  Faça o Push para o Branch (`git push origin feature/NovaFeature`).
5.  Abra um Pull Request.

## 📝 Licença

Distribuído sob a licença MIT. Veja `LICENSE` para mais informações.

