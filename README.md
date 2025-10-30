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
| **atuin** | [atuinsh/atuin](https://github.com/atuinsh/atuin) | Улучшенная история shell с синхронизацией и поиском. |
| **bandwhich** | [imsnif/bandwhich](https://github.com/imsnif/bandwhich) | Монитор сетевого трафика. |
| **broot** | [Canop/broot](https://github.com/Canop/broot) | Просмотр файловой системы в виде дерева. |
| **bat** | [sharkdp/bat](https://github.com/sharkdp/bat) | Замена `cat` с подсветкой синтаксиса. |
| **bottom** | [ClementTsang/bottom](https://github.com/ClementTsang/bottom) | Современный системный монитор. |
| **dust** | [bootandy/dust](https://github.com/bootandy/dust) | Визуализатор дискового пространства (альтернатива `du`). |
| **delta** | [dandavison/delta](https://github.com/dandavison/delta) | Красивый git diff с подсветкой. |
| **dog** | [titov32/dog](https://github.com/titov32/dog) | DNS-клиент (форк ogham/dog). |
| **eza** | [eza-community/eza](https://github.com/eza-community/eza) | Улучшенный `ls`. |
| **fclones** | [pkolaczk/fclones](https://github.com/pkolaczk/fclones) | Поиск и удаление дубликатов файлов. |
| **fd** | [sharkdp/fd](https://github.com/sharkdp/fd) | Быстрый поиск файлов. |
| **fselect** | [jhspetersson/fselect](https://github.com/jhspetersson/fselect) | SQL-поиск по файловой системе. |
| **jless** | [titov32/jless](https://github.com/titov32/jless) | Навигация по JSON-файлам. |
| **lfs** | [canop/lfs](https://crates.io/crates/lfs) | Лёгкий аналог `less`. |
| **lsd** | [lsd-rs/lsd](https://github.com/lsd-rs/lsd) | Красивый `ls` с иконками. |
| **macchina** | [macchina-cli/macchina](https://github.com/macchina-cli/macchina) | Кастомизируемый system info tool. |
| **procs** | [dalance/procs](https://github.com/dalance/procs) | Современный аналог `ps`. |
| **pipr** | [elkowar/pipr](https://github.com/elkowar/pipr) | Визуальный редактор пайплайнов команд. |
| **ripgrep (rg)** | [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep) | Быстрый поиск по содержимому файлов. |
| **tealdeer (tldr)** | [dbrgn/tealdeer](https://github.com/dbrgn/tealdeer) | Укороченные man-страницы. |
| **tokei** | [XAMPPRocky/tokei](https://github.com/XAMPPRocky/tokei) | Подсчёт строк кода. |
| **zoxide** | [ajeetdsouza/zoxide](https://github.com/ajeetdsouza/zoxide) | Умный `cd` для быстрого перехода по директориям. |
| **xh** | [ducaale/xh](https://github.com/ducaale/xh) | HTTP-клиент, альтернатива curl/httpie. |
| **trippy** | [fujiapple852/trippy](https://github.com/fujiapple852/trippy) | Современный traceroute с визуализацией. |
| **uv** | [astral-sh/uv](https://github.com/astral-sh/uv) | Быстрый пакетный менеджер и изолятор Python. |
| **gping** | [orf/gping](https://github.com/orf/gping) | `ping` с графиками RTT. |
| **hyperfine** | [sharkdp/hyperfine](https://github.com/sharkdp/hyperfine) | Бенчмаркинг CLI-команд. |
| **sd** | [chmln/sd](https://github.com/chmln/sd) | Замена `sed` с простым синтаксисом. |
| **gitu** | [altsem/gitu](https://github.com/altsem/gitu) | TUI-интерфейс для Git. |
| **hexyl** | [sharkdp/hexyl](https://github.com/sharkdp/hexyl) | Красивый hex-дамп файлов. |
| **xsv** | [BurntSushi/xsv](https://github.com/BurntSushi/xsv) | Быстрые операции с CSV. |
| **t-rec** | [sassman/t-rec-rs](https://github.com/sassman/t-rec-rs) | Запись терминала в GIF. |
| **kmon** | [orhun/kmon](https://github.com/orhun/kmon) | TUI для мониторинга ядра Linux. |
| **pueue** | [Nukesor/pueue](https://github.com/Nukesor/pueue) | Планировщик фоновых задач. |
| **starship** | [starship/starship](https://github.com/starship/starship) | Быстрый и кастомизируемый shell prompt. |
| **grex** | [pemistahl/grex](https://github.com/pemistahl/grex) | Генератор регулярных выражений по примерам. |

---
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
