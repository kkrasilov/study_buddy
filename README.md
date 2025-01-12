StudyBuddy – платформа для совместного обучения и обмена знаниями.

Стек технологий
Ruby: 3.2.2
Rails: 7.0
JS Bundler: Vite
Установка и настройка
Предварительные требования

Ruby 3.2.2
Rails 7.0
Node.js и npm (для Vite)
PostgreSQL (или другой поддерживаемый реляционный СУБД)
Шаги установки
Клонируйте репозиторий:

git@github.com:kkrasilov/study_buddy.git
cd study_buddy
Установите зависимости:

bundle install
npm install
Настройте базу данных:

Создайте файл config/database.yml на основе config/database.yml.example и внесите необходимые изменения для вашей среды. Затем выполните миграции:

rails db:create
rails db:migrate
Запустите сервер разработки:

rails server
В отдельном терминале запустите Vite:

bin/vite dev
Приложение должно быть доступно по адресу http://localhost:3000.
