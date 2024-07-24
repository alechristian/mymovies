# My Movies

## Sobre o Projeto
My Movies é um aplicativo desenvolvido com Flutter, utilizando a biblioteca GetX para gerenciamento de estado, navegação e injeção de dependência. O aplicativo permite aos usuários visualizar uma lista de filmes e marcar seus favoritos.

## Funcionalidades
- **Navegação**: Utiliza GetX para navegação entre as páginas de lista de filmes e favoritos.
- **Gerenciamento de Estado**: GetX é usado também para o gerenciamento de estado, facilitando a atualização da UI baseada nas mudanças de estado dos filmes favoritos.
- **Requisição à APIs**: Utiliza o package Dio
- **Design Responsivo**: Adapta-se a diferentes tamanhos de tela, garantindo uma boa experiência em dispositivos móveis e tablets e web.

## Tecnologias Utilizadas
- Flutter
- GetX
- Dio

## Capturas de Tela do Projeto

<p align="center">
  <img src="assets\readme_images\home_page.png" width="200" title="Tela Inicial">
  <img src="assets\readme_images\home_page_dialog.png" width="200" title="Lista de Filmes">
  <img src="assets\readme_images\favorites_page.png" width="200" title="Detalhes do Filme">
  <img src="assets\readme_images\info_dialog.png" width="200" title="Favoritos">
</p>

## Como Rodar o Projeto

### Pré-requisitos
Para rodar este projeto, você precisa ter o Flutter instalado na sua máquina. Para instalar o Flutter, siga as instruções disponíveis na [documentação oficial](https://flutter.dev/docs/get-started/install).

### Como rodar o projeto:

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/my_movies.git
```

2. Entre no diretório do projeto:
```bash
cd my_movies
```

3. Instalar dependências
```bash
flutter pub get
```

4. Executar o aplicativo
```bash
flutter run
```

### Observações Importantes

- **Proteção da API Key**: A chave da API (`api_key`) utilizada neste projeto está protegida e não é exposta diretamente no código. Utilizamos variáveis de ambiente para gerenciar a `api_key` de forma segura. 
