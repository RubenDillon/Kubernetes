## III. Конфігурація
### Зберігайте конфігурацію в середовищі виконання

*Конфігурація* застосунку — це все, що може змінюватися між [розгортаннями](./codebase) (staging-розгортання, production-розгортання, локальне середовище розробника тощо). Це включає:

* Параметри підключення до бази даних, Memcached і інших [сторонніх сервісів](./backing-services);
* Реєстраційні дані для підключення до зовнішніх сервісів, таких як Amazon S3 або Twitter;
* Значення, що залежать від середовища розгортання, такі як канонічне ім'я хосту.

Застосунки іноді зберігають конфігурації як константи в коді. Це є порушенням методології дванадцяти факторів, яка вимагає **обов'язкового відокремлення конфігурації від коду**. Конфігурації застосунку в розгортаннях суттєво відрізняються, код — однаковий.

Лакмусовим папірцем того, чи правильно розділені конфігурація і код, є можливість в будь-який момент відкрити вихідний код застосунку у вільний доступ, при цьому не оприлюднюючи будь-яких приватних даних.

Зверніть увагу, що визначення "конфігурації" **не включає** в себе внутрішні налаштування застосунку, такі як `сonfig/routes.rb` в Rails, або [як пов'язані основні модулі](http://docs.spring.io/spring/docs/current/spring-framework-reference/html/beans.html) в [Spring](http://spring.io/). Ці налаштування не змінюються між розгортаннями, і тому краще місце для них — саме в коді.

Іншим підходом до конфігурації є використання конфігураційних файлів, що не зберігаються в систему контролю версій, таких як `сonfig/database.yml` в Rails. Це перевага у порівнянні з використанням констант в коді, але все ж таки має суттєві недоліки: є ймовірність помилково зберегти файл конфігурації в репозиторій; існує тенденція коли конфігураційні файли розкидані в різних місцях і в різних форматах, і стає важко передивлятися всі налаштування і керувати ними в одному місці. Крім того, формати цих файлів, як правило, специфічні для конкретної мови програмування чи фреймворку.

**Застосунок дванадцати факторів зберігає конфігурацію в *змінних оточення*** (часто скорочується до *env vars* або *env*). Значення змінних оточення легко змінити між розгортаннями без зміни коду; на відміну від конфігураційних файлів, менш ймовірно випадково зберегти їх в репозиторій коду; і на відміну від конфігураційних файлів або інших механізмів конфігурації, таких як Java System Properties, вони є стандартом, незалежним від мови програмування чи фреймворку.

Іншим аспектом керування конфігурацією є групування. Іноді застосунки об'єднують конфігурації в іменовані групи (які часто називаються "оточеннями"), які називаються в залежності від конкретного розгортання, наприклад, `development`, `test` і `production` оточення в Rails. Цей метод погано масштабується: чим більше створюється різних розгортань застосунку, тим більше необхідно нових імен оточень, наприклад, `staging` або `qa`. При подальшому рості проекту розробники можуть додавати свої власні спеціальні оточення, наприклад, `joes-staging`, що призводить до комбінаторного вибуху конфігурації, який робить керування розгортанням застосунку нестабільним.

У застосунку дванадцяти факторів змінні оточення є незв'язаними між собою засобами керування. Кожна змінна повністю незалежна від інших. Вони ніколи не групуються разом в "оточення", керування ними здійснюється незалежно для кожного розгортання. Ця модель добре масштабується разом з появою більшої кількості розгортань застосунку протягом його експлуатації.