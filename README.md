# Система управления интернет-магазином электроники

* **Используемая СУБД (система управления базами даннных) - Mysql**
* **Ознакомится с логической и концептуальной моделью можно нажав - [здесь](https://imshef.github.io/Online-Store/index.html "Log & Conc Model")**
> Вдохновлялся [этим репозиторием](https://github.com/Wenwu-PA/SQL-UEPA-System "Repositories")

## Концептуальная модель база данных:

| Сущность      | Ключевые атрибуты                     | Описание                            |
| ------------- | ------------------------------------- | ----------------------------------- |
| **Category**  | category_id, name                     | Категория товаров                   |
| **Supplier**  | supplier_id, name                     | Поставщик товаров                   |
| **Product**   | product_id, name, price               | Товар интернет-магазина             |
| **Customer**  | customer_id, name, email              | Клиент магазина                     |
| **Order**     | order_id, order_date, status          | Заказ, создаваемый клиентом         |
| **OrderItem** | order_id, product_id, quantity, price | Позиция товара в заказе             |
| **Inventory** | product_id, quantity_in_stock         | Текущее количество товара на складе |


## Логическая модель базы данных:
![Изображение](https://raw.githubusercontent.com/ImShef/Online-Store/refs/heads/main/PhysModel/diagramm.png "Диаграмма")
