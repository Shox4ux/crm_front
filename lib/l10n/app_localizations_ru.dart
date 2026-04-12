// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Мое Flutter Приложение';

  @override
  String greeting(String name) {
    return 'Привет, $name!';
  }

  @override
  String get crmLogin => 'Вход в CRM';

  @override
  String get dashboard => 'Панель управления';

  @override
  String get clientInfo => 'Информация о клиенте';

  @override
  String get clientInvoice => 'Счет клиента';

  @override
  String get clients => 'Клиенты';

  @override
  String get orderOverview => 'Обзор заказов';

  @override
  String get productInfo => 'Информация о товаре';

  @override
  String get productExpenses => 'Расходы на товары';

  @override
  String get createProduct => 'Создать товар';

  @override
  String get basePrice => 'Себестоимость';

  @override
  String get spentAmount => 'Потрачено';

  @override
  String get create => 'Создать';

  @override
  String get products => 'Товары';

  @override
  String get warehouse => 'Склад';

  @override
  String get wareProducts => 'Товары на складе';

  @override
  String get add => 'Добавить';

  @override
  String get cancel => 'Отмена';

  @override
  String get chooseImage => 'Выберите изображение';

  @override
  String get createClient => 'Создать клиента';

  @override
  String get delete => 'Удалить';

  @override
  String get edit => 'Редактировать';

  @override
  String get login => 'Вход';

  @override
  String get refresh => 'Обновить';

  @override
  String get retry => 'Повторить';

  @override
  String get address => 'Адрес';

  @override
  String get amount => 'Сумма';

  @override
  String get expenseName => 'Cоздать расхода';

  @override
  String get name => 'Имя';

  @override
  String get password => 'Пароль';

  @override
  String get phone => 'Телефон';

  @override
  String get productName => 'Название товара';

  @override
  String get profitMargin => 'Прибыль';

  @override
  String get quantity => 'Количество';

  @override
  String get secretWord => 'Кодовое слово';

  @override
  String get sellPrice => 'Цена продажи';

  @override
  String get username => 'Имя пользователя';

  @override
  String get dateFormat => 'дд.мм.гггг';

  @override
  String get price => 'Цена';

  @override
  String get product => 'Товар';

  @override
  String get qty => 'Кол-во';

  @override
  String get warehouseHint => 'Склад';

  @override
  String get confirmDelete => 'Подтвердить удаление';

  @override
  String get deleteConfirmationMessage =>
      'Вы уверены, что хотите удалить этот товар?';

  @override
  String get pleaseEnterValue => 'Пожалуйста, введите значение';

  @override
  String get action => 'Действие';

  @override
  String get actualPrice => 'Фактическая цена';

  @override
  String get stock => 'Запас';

  @override
  String get total => 'Итого';

  @override
  String get appDrawer => 'Меню';

  @override
  String get home => 'Главная';

  @override
  String get logout => 'Выход';

  @override
  String get orders => 'Заказы';

  @override
  String get settings => 'Параметры';

  @override
  String get chooseLanguage => 'Выберите язык';

  @override
  String get english => 'Английский';

  @override
  String get russian => 'Русский';

  @override
  String get required => 'Обязательное';

  @override
  String get fieldCannotBeEmpty => 'Это поле не может быть пустым';

  @override
  String get searchByName => 'Поиск по имени';

  @override
  String get select => 'Выбрать';

  @override
  String get enter => 'Введите';

  @override
  String get editClient => 'Редактировать клиента';

  @override
  String get successfullyCreated => 'Успешно создано';

  @override
  String get successfullyDeleted => 'Успешно удалено';

  @override
  String get successfullyUpdated => 'Успешно обновлено';

  @override
  String get orderCreatedSuccessfully => 'Заказ успешно создан';

  @override
  String get orderUpdatedSuccessfully => 'Заказ успешно обновлен';

  @override
  String get orderDeletedSuccessfully => 'Заказ успешно удален';

  @override
  String get totalClients => 'Всего клиентов';

  @override
  String get totalOrders => 'Всего заказов';

  @override
  String get totalRevenue => 'Общая выручка';

  @override
  String get unpaidInvoices => 'Неоплаченные счета';

  @override
  String get acceptedStatus => 'Принят';

  @override
  String get rejectedStatus => 'Отклонен';

  @override
  String get paidStatus => 'Оплачено';

  @override
  String get unpaidStatus => 'Не оплачено';

  @override
  String get paidOrder => 'Оплачено';

  @override
  String get prepaidOrder => 'Предоплачен';

  @override
  String get unpaidOrder => 'Не оплачено';

  @override
  String get all => 'Все';

  @override
  String get comingProduct => 'Поступает';

  @override
  String get existsProduct => 'Есть в наличии';

  @override
  String get number => 'номер';

  @override
  String get date => 'дата';

  @override
  String get orderDate => 'дата заказа';

  @override
  String get deliveryDate => 'дата доставки';

  @override
  String get actualQty => 'фактическое кол-во';

  @override
  String get warehouseQty => 'кол-во на складе';

  @override
  String get totalAmount => 'общая сумма';

  @override
  String get paidAmount => 'оплаченная сумма';

  @override
  String get debt => 'задолженность';

  @override
  String get status => 'Статус';

  @override
  String get forThisMonth => 'в этом месяце';

  @override
  String get november => 'Ноябрь';

  @override
  String get december => 'Декабрь';

  @override
  String get addItem => 'Добавить товар';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get units => 'товаров';

  @override
  String get editWarehouse => 'Редактировать склад';

  @override
  String get changeImage => 'Изменить изображение';

  @override
  String get dataNotFound => 'Данные не найдены';

  @override
  String get fromDate => 'С даты';

  @override
  String get toDate => 'По дату';

  @override
  String get resetFilter => 'Сброс фильтра';

  @override
  String get createWarehouse => 'Создать склад';

  @override
  String get addWareProduct => 'Добавить товар на склад';

  @override
  String get editWareProduct => 'Редактировать товар на складе';

  @override
  String get createOrder => 'Создать заказ';

  @override
  String get editOrder => 'Редактировать заказ';

  @override
  String get client => 'Клиент';

  @override
  String get paidAmountField => 'Оплаченная сумма';

  @override
  String get deliveryOn => 'Дата доставки';

  @override
  String totalAmountLabel(String amount) {
    return 'Общая сумма: \$ $amount';
  }
}
