# VisualProlog609
[![Github All Releases](https://img.shields.io/github/downloads/MahBoiDeveloper/VisualProlog609/total.svg)](https://github.com/MahBoiDeveloper/VisualProlog609/releases)

Данный репозиторий хранит принятые лабораторные работы по предмету "Методы Синтеза Оптимальных Проектных Решений" (МСОПР). Основная цель репозитория — накапливать базу проверенных задач, чтобы студентам было проще ориентироваться в нестандартных задачах.

## Как начать работать над проектом
1. Скачайте [архив с Visual Prolog](https://github.com/MahBoiDeveloper/VisualProlog609/releases/download/v0/Visual_Prolog.rar);
2. Разархивируйте, и запустите ярлык, который там находится, либо в папке `VIP\BIN\WIN\32` запускаем файл `vip.exe`;
3. Выберите вкладку `Options` на верхней панели, пункт `Global\Environment` и установите параметры настройки. В первую очередь, следует проверить на закладке `Fonts`, что для используемых шрифтов установлен кириллический набор символов. Для удобства можно использовать [моноширинные шрифты](https://ru.wikipedia.org/wiki/Моноширинный_шрифт), такие как `Consolas` или `Courier New`;
4. ...
5. Profit!

## Стиль кода исходников
Помимо того, что файлы должны быть в кодировке Windows-1251, вы должны понимать базовый синтаксис Visual Prolog и используемый стиль кода в репозитории. Примерное описание стиля:
1. Основные требования находятся в [архиве Study_materials.rar (лежат в корне)](https://github.com/MahBoiDeveloper/VisualProlog609/releases/download/v0/Study_materials.rar);
2. Файлы должны быть в кодировке Windows-1251 **aka** cp1251;
3. Длина любой строки не должна превышать 130 символов;
4. Нотацию названий для предикатов и переменных можно выбирать любую (Visual Prolog'ом поддерживаются только [верблюжья](https://ru.wikipedia.org/wiki/CamelCase) и [змеиная](https://ru.wikipedia.org/wiki/Snake_case)), но желательно придерживаться одной нотацией на протяжении всей программы, чтобы все переменные или предикаты были в одной нотации, и не было бы каши в названиях из разных нотаций для одного вида объектов;
5. Крайне желательно писать код в C-подобном стиле, т.к. он наиболее читаем, например [вот так](https://github.com/MahBoiDeveloper/VisualProlog609/blob/main/AI330.pro).

## Добавление новых задач в репозиторий
Если вы не знакомы с **git**'ом, то можете быстро ознакомится на каком-то сайте, по типу [хабра](https://habr.com/ru/post/342116/), либо фундаментально через прочтение этой [книги](https://github.com/MahBoiDeveloper/VisualProlog609/releases/download/v0/Git.pdf). После того, как вы сделаете задачу и проверите её работоспособность, вы можете оформить [pull request](https://github.com/MahBoiDeveloper/VisualProlog609/pulls) в наш репозиторий, описав что за задачу вы решили, какой ответ она даёт, какие нюансы работы имеются у программы. Мы рассмотрим вашу задачу, и если она подходит всем условиям, то мы примем пул реквест.

## Кооперация
Вы можете попросить совета у других программистов, а также задать вопросы по теме репозитория на нашем дискорд сервере: https://discord.gg/7qhpBCApw2
