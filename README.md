## Реализовать систему учета транспортных средств, с последующим получением статистики.
## Менеджер вводит данные автомобиля, записывает в базу:

*   государственный номер автомобиля (текст, любой набор букв и цифр)
*   марка (дроп-даун, см приложение)
*   модель (дроп-даун, см приложение)
*   год выпуска (YYYY)


## Администратор может смотреть аналитику по имеющимся авто:
*   Количество уникальных автомобилей с разными параметрами (фильтр)
*   Количество автомобилей которые добавил менеджер
*   Был ли повторный учет авто.


При реализации представьте, что данное приложение будет размещено в prod на следующий день.
Красота интерфейса не важна. 
Приложение нужно опубликовать.

Приложение - список марок и моделей для интерфейса в формате json:
```
[
   {
       “mark”: “Audi”,
       “models”: [
           “TT”,
           “Q5”,
           “A8"
       ]
   },
   {
       “mark”: “Ford”,
       “models”: [
           “Escape”,
           “Fiesta”,
           “Focus”
       ]
   },
   {
       “mark”: “Honda”,
       “models”: [
           “Accord”,
           “Integra”,
           “S2000"
       ]
   }
]
```