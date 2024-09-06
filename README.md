# Students Management App

Este é um aplicativo Flutter modularizado que gerencia informações de estudantes, cursos e dashboard. Ele utiliza o `flutter_modular` para injeção de dependências e navegação, além do `dio` para a comunicação com APIs externas.

## 📋 Requisitos

Certifique-se de ter as seguintes ferramentas instaladas:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (versão 2.0 ou superior)
- [Dart](https://dart.dev/get-dart)
- Um editor de texto (recomendado: [Visual Studio Code](https://code.visualstudio.com/) ou [Android Studio](https://developer.android.com/studio))

## 🚀 Instalação

1. Instale as dependências do Flutter:

   ```bash
   flutter pub get
   ```

2. Execute o aplicativo em um emulador ou dispositivo:

   ```bash
   flutter run
   ```

## 🛠️ Arquitetura do Projeto

O projeto está organizado em uma arquitetura modular, seguindo o princípio de separação de responsabilidades. O projeto é dividido em **Core**, **Domain**, **Impl**, e **Modules**.

### Estrutura de Pastas

```bash
lib/
├── core/                   # Componentes essenciais e compartilhados
│   ├── env/                # Gerenciamento de variáveis de ambiente
│   └── rest_client/        # Cliente REST usando Dio
├── domain/                 # Camada de domínio contendo entidades e contratos
│   ├── entities/           # Entidades que modelam os dados do sistema
│   ├── repositories/       # Contratos dos repositórios
│   └── services/           # Contratos dos serviços
├── impl/                   # Implementações dos repositórios e serviços
│   ├── repositories/       # Implementação dos repositórios
│   ├── serializers/        # Serializadores para conversão de dados
│   └── services/           # Implementações dos serviços
├── modules/                # Módulos do Flutter Modular
│   ├── courses/            # Gerenciamento de cursos
│   ├── dashboard/          # Painel de visualização de dados
│   ├── home/               # Tela inicial
│   └── students/           # Gerenciamento de estudantes
├── main.dart               # Ponto de entrada da aplicação
└── main_module.dart        # Configuração inicial dos módulos
```

### Camada **Core**

Esta camada contém utilitários e serviços fundamentais, como o cliente REST (`dio_rest_client.dart`) e variáveis de ambiente (`env.dart`).

### Camada **Domain**

Esta camada representa a lógica de negócios, onde ficam as **entidades** (ex.: `students_entity.dart`, `course_entity.dart`), **repositórios** e **serviços** em seus contratos.

- **Entidades**: Modelos de dados que representam os objetos principais do sistema, como estudantes, cursos e matrículas.
- **Repositórios**: Interfaces que definem os métodos que cada repositório deve implementar.
- **Serviços**: Interfaces que definem os serviços que fornecem dados para as camadas superiores (controladores).

### Camada **Impl**

Aqui estão as implementações concretas das interfaces da camada de domínio. Por exemplo, o `StudentsRepositoryImpl` implementa o contrato `IStudentsRepository`.

- **Repositórios**: Implementações de acesso a dados, como `StudentsRepositoryImpl`.
- **Serializers**: Para conversão de objetos entre formatos, como JSON e objetos Dart.
- **Serviços**: Implementações concretas dos serviços de negócios.

### **Modules**

Os módulos do `flutter_modular` gerenciam rotas, controladores e dependências de cada parte do sistema. Exemplos:

- **StudentsModule**: Gerencia as rotas e controladores relacionados aos estudantes.
- **CoursesModule**: Gerencia a funcionalidade de cursos.
- **DashboardModule**: Exibe o painel de visualização com gráficos e informações.
  
Cada módulo contém seu próprio controlador, página e, em alguns casos, widgets personalizados.

### Exemplo de Injeção de Dependências (StudentsModule)

```dart
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_vr_flutter/impl/repositories/students_repository_impl.dart';
import 'package:teste_vr_flutter/modules/students/students_controller.dart';
import 'package:teste_vr_flutter/modules/students/students_page.dart';
import 'package:teste_vr_flutter/core/rest_client/dio_rest_client.dart';

class StudentsModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => DioRestClient()),  // Cliente HTTP com Dio
    Bind.singleton((i) => StudentsRepositoryImpl(i.get<DioRestClient>())),
    Bind.singleton((i) => StudentsController(i.get<StudentsRepositoryImpl>())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => StudentsPage()),
    // Outras rotas...
  ];
}
```

## 🖼️ Funcionalidades Principais

- **Gerenciamento de Estudantes**: Cadastrar, editar, remover e listar informações sobre os estudantes.
- **Gerenciamento de Cursos**: Criar novos cursos, listar e editar cursos existentes.
- **Dashboard**: Visualizar dados resumidos em gráficos e cartões de informação.

### Navegação e Rotas

O projeto usa o `flutter_modular` para gerenciar a navegação de forma desacoplada. Cada módulo possui suas próprias rotas:

- **Home**: `/home`
- **Estudantes**: `/students`
- **Cursos**: `/courses`
- **Dashboard**: `/dashboard`

Para navegar entre as rotas, utilize o `Modular.to.pushNamed`:

```dart
Modular.to.pushNamed('/students');
```


## 📄 Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

