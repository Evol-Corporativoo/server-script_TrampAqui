```sh
composer init
composer exec -n
composer dump-autoload -o
composer require --dev phpunit/phpunit
```
```sh
./vendor/bin/phpunit tests/ImcTest.php
./vendor/bin/phpunit tests/PaganteIRTest.php
XDEBUG_MODE=coverage ./vendor/bin/phpunit tests --coverage-html coverage --coverage-filter app/
```