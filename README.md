# rust-tools 🦀🔧

Набор утилит на Rust, собранных в **статически линкуемом варианте через musl** и упакованных в удобный Docker-образ.  
Идеально подходит для минималистичных окружений, CI/CD и контейнеров с жёсткими требованиями к размеру и зависимостям.

---

## 🚀 Особенности

- **musl-сборка**: все бинарники полностью статически слинкованы → не нужны системные зависимости.  
- **Минимальный размер образа**: можно использовать даже в `scratch`-контейнерах.  
- **Кроссплатформенность**: работает одинаково в разных Linux-дистрибутивах.  
- **Простота интеграции**: достаточно запустить контейнер или взять готовый бинарь.  

## 📋 Список инструментов

| Инструмент | Ссылка | Описание |
|------------|--------|----------|
| **atuin** | [atuinsh/atuin](https://github.com/atuinsh/atuin) | Улучшенная история командной строки с синхронизацией и поиском. |
| **bandwhich** | [imsnif/bandwhich](https://github.com/imsnif/bandwhich) | Интерактивный монитор сетевого трафика. |
| **broot** | [Canop/broot](https://github.com/Canop/broot) | Древовидный просмотр файловой системы с быстрым поиском. |
| **bat** | [sharkdp/bat](https://github.com/sharkdp/bat) | Замена `cat` с подсветкой синтаксиса и номерами строк. |
| **bottom** | [ClementTsang/bottom](https://github.com/ClementTsang/bottom) | Современный системный монитор в стиле htop/gtop. |
| **dust** | [bootandy/dust](https://github.com/bootandy/dust) | Более удобная замена `du`, визуализирующая размер директорий. |
| **delta** | [dandavison/delta](https://github.com/dandavison/delta) | Красивый просмотр git diff с подсветкой. |
| **dog** | [titov32/dog](https://github.com/titov32/dog) | DNS-клиент (форк утилиты [ogham/dog](https://github.com/ogham/dog)). |
| **eza** | [eza-community/eza](https://github.com/eza-community/eza) | Улучшенная альтернатива `ls`. |
| **fclones** | [pkolaczk/fclones](https://github.com/pkolaczk/fclones) | Поиск и управление дубликатами файлов. |
| **fd** | [sharkdp/fd](https://github.com/sharkdp/fd) | Быстрый и удобный поиск файлов. |
| **fselect** | [jhspetersson/fselect](https://github.com/jhspetersson/fselect) | SQL-подобный поиск по файловой системе. |
| **jless** | [titov32/jless](https://github.com/titov32/jless) | Просмотрщик JSON с навигацией и фильтрацией. |
| **lfs** | [canop/lfs](https://crates.io/crates/lfs) | Лёгкий просмотрщик файлов (аналог `less`). |
| **lsd** | [lsd-rs/lsd](https://github.com/lsd-rs/lsd) | Красивый `ls` с иконками и деревом. |
| **macchina** | [macchina-cli/macchina](https://github.com/Macchina-CLI/macchina) | Быстрый и кастомизируемый system info tool. |
| **procs** | [dalance/procs](https://github.com/dalance/procs) | Современный аналог `ps` с удобным UI. |
| **pipr** | [elkowar/pipr](https://github.com/elkowar/pipr) | Визуальный редактор пайплайнов команд. |
| **ripgrep (rg)** | [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep) | Молниеносный поиск по содержимому файлов. |
| **tealdeer (tldr)** | [dbrgn/tealdeer](https://github.com/dbrgn/tealdeer) | Упрощённые страницы man/tldr. |
| **tokei** | [XAMPPRocky/tokei](https://github.com/XAMPPRocky/tokei) | Подсчёт строк кода в проекте. |
| **zoxide** | [ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide) | Умный `cd`, запоминающий часто используемые директории. |
| **xh** | [ducaale/xh](https://github.com/ducaale/xh) | Лёгкий HTTP-клиент (альтернатива curl/httpie). |
| **trippy** | [fujiapple852/trippy](https://github.com/fujiapple852/trippy) | Современный `traceroute` с визуализацией. |

---

## 📦 Установка и запуск

### 1. Собрать образ

```bash
git clone https://github.com/titov32/rust-tools.git
cd rust-tools
docker build -t rust-tools:latest .
```
## 2. Запуск утилиты из контейнера

```bash
docker run --rm rust-tools:latest <имя-утилиты> [аргументы]
```

## 3. Использование бинарей напрямую

Поскольку все бинарники собраны с musl, их можно копировать и использовать отдельно:

```bash
docker cp $(docker create rust-tools:latest):/usr/local/bin/my-tool ./my-tool
./my-tool --version
```

✨ Преимущества musl-сборки

✔ Не ломается от обновлений glibc.

✔ Подходит для Alpine Linux, scratch-контейнеров и других лёгких окружений.

✔ Упрощает деплой: один бинарь → одна команда.

✔ Предсказуемое поведение на всех Linux-дистрибутивах.
