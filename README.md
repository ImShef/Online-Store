# Система управления интернет-магазином электроники

* **Используемая СУБД (система управления базами даннных) - Mysql**
* **Ознакомится с логической и концептуальной моделью можно нажав - [здесь](https://imshef.github.io/Online-Store/index.html "Log & Conc Model")**
> Вдохновлялся [этим репозиторием](https://github.com/Wenwu-PA/SQL-UEPA-System "Repositories")

## Концептуальная модель база данных:

| Сущность | Описание | Ключевые атрибуты |
|----------|-----------|-------------------|
| **👥 Customers** | Зарегистрированные клиенты магазина | customer_id, first_name, last_name, email, phone, address |
| **📦 Products** | Товары электроники в каталоге | product_id, product_name, description, price, category_id, supplier_id |
| **🏷️ Categories** | Категории и подкатегории товаров | category_id, category_name, parent_category_id |
| **🏭 Suppliers** | Поставщики и производители | supplier_id, company_name, contact_name, phone |
| **🛒 Orders** | Заказы клиентов | order_id, customer_id, order_date, status, total_amount |
| **📋 Order_Items** | Позиции в заказах | order_item_id, order_id, product_id, quantity, unit_price |
| **📊 Inventory** | Складские остатки товаров | inventory_id, product_id, quantity, last_restocked |

## Логическая модель базы данных:
![Изображение](https://raw.githubusercontent.com/ImShef/Online-Store/refs/heads/main/PhysModel/diagramm.png "Диаграмма")
