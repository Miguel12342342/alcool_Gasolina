# FuelWise — Álcool ou Gasolina?


> Descubra em segundos qual combustível é mais vantajoso para o seu carro flex.

<img width="390" height="850" alt="Screenshot do app FuelWise" src="https://github.com/user-attachments/assets/6abf96fa-9097-4ec3-86b2-b5a2a9f53e9a" />

---

## Sobre o projeto

O **FuelWise** é um aplicativo Flutter que aplica a regra dos 70% para ajudar motoristas de carros flex a decidir entre álcool (etanol) e gasolina no momento do abastecimento. Além da recomendação, exibe a razão de preço e estima a economia por tanque cheio.

---

## Como funciona o cálculo

Carros flex têm rendimento médio de **70% com álcool** em relação à gasolina — ou seja, consomem mais litros para percorrer a mesma distância. O álcool só é vantajoso quando seu preço compensa esse consumo extra:

$$
\text{razão} = \frac{\text{Preço do Álcool}}{\text{Preço da Gasolina}}
$$

| Resultado | Condição |
|---|---|
| Abasteça com **Álcool** | razão ≤ 0,70 |
| Abasteça com **Gasolina** | razão > 0,70 |

**Estimativa de economia por tanque (50 L):**

$$
\text{Economia} = (\text{P\textsubscript{gasolina}} \times 50) - \left(\text{P\textsubscript{álcool}} \times \frac{50}{0{,}70}\right)
$$

---

## Tecnologias

| Pacote | Versão | Uso |
|---|---|---|
| Flutter SDK | ≥ 3.10 | Framework UI multiplataforma |
| Dart SDK | ≥ 3.10 | Linguagem |
| [provider](https://pub.dev/packages/provider) | ^6.1.5 | Gerenciamento de estado (ChangeNotifier) |
| [google_fonts](https://pub.dev/packages/google_fonts) | ^8.0.2 | Tipografia (Inter) |
| [intl](https://pub.dev/packages/intl) | ^0.20.2 | Formatação de moeda (pt-BR) |

---

## Arquitetura

```
lib/
├── main.dart                  # Entrada — registra MultiProvider
├── pages/
│   └── home_page.dart         # Tela principal com feedback de erro
├── providers/
│   └── fuel_provider.dart     # Lógica de negócio e estado
├── widgets/
│   ├── custom_header.dart     # Header com botão de reset
│   ├── hero_banner.dart       # Banner com gradiente local
│   ├── fuel_input_card.dart   # Card de entrada de preço
│   ├── calculate_button.dart  # Botão de calcular
│   └── result_section.dart    # Resultado, razão e economia
└── theme/
    ├── app_colors.dart        # Paleta de cores e gradientes
    └── app_theme.dart         # ThemeData Material 3
```

O estado global vive no `FuelProvider` (Provider + ChangeNotifier). Widgets são todos `StatelessWidget`, exceto `HomePage` que gerencia os `TextEditingController` e o listener de erro.

---

## Rodando o projeto

### Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) ≥ 3.10
- Android Studio ou VS Code com extensão Flutter
- Dispositivo físico ou emulador conectado

### Passos

```bash
# 1. Clone o repositório
git clone https://github.com/Miguel12342342/alcool_Gasolina.git
cd alcool_Gasolina

# 2. Instale as dependências
flutter pub get

# 3. Execute
flutter run
```

### Rodando os testes

```bash
flutter test
```

Saída esperada: **13 testes passando**, cobrindo recomendação de combustível, cálculo de economia, entradas inválidas e reset.

---

## Licença

Distribuído sob a licença MIT. Veja [`LICENSE`](LICENSE) para mais informações.
