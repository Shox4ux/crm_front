import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'My Flutter App'**
  String get appTitle;

  /// A greeting message with a dynamic name
  ///
  /// In en, this message translates to:
  /// **'Hello, {name}!'**
  String greeting(String name);

  /// Title for the login screen
  ///
  /// In en, this message translates to:
  /// **'CRM Login'**
  String get crmLogin;

  /// Dashboard screen title
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// Client information section title
  ///
  /// In en, this message translates to:
  /// **'Client Info'**
  String get clientInfo;

  /// Client invoice section title
  ///
  /// In en, this message translates to:
  /// **'Client Invoice'**
  String get clientInvoice;

  /// Clients screen title and menu item
  ///
  /// In en, this message translates to:
  /// **'Clients'**
  String get clients;

  /// Order overview section title
  ///
  /// In en, this message translates to:
  /// **'Order Overview'**
  String get orderOverview;

  /// Product information section title
  ///
  /// In en, this message translates to:
  /// **'Product Info'**
  String get productInfo;

  /// Product expenses section title
  ///
  /// In en, this message translates to:
  /// **'Product Expenses'**
  String get productExpenses;

  /// App bar title for the product creation screen
  ///
  /// In en, this message translates to:
  /// **'Create Product'**
  String get createProduct;

  /// Label for the base price value
  ///
  /// In en, this message translates to:
  /// **'Base Price'**
  String get basePrice;

  /// Table column header for expense amount spent
  ///
  /// In en, this message translates to:
  /// **'Spent Amount'**
  String get spentAmount;

  /// Button label to create an item
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// Products screen title and menu item
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// Warehouse screen title and menu item
  ///
  /// In en, this message translates to:
  /// **'Warehouse'**
  String get warehouse;

  /// Warehouse products screen title and menu item
  ///
  /// In en, this message translates to:
  /// **'Ware Products'**
  String get wareProducts;

  /// Button label to add a new item
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// Button label to cancel an action
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Button label to choose an image
  ///
  /// In en, this message translates to:
  /// **'Choose Image'**
  String get chooseImage;

  /// Button label to create a new client
  ///
  /// In en, this message translates to:
  /// **'Create Client'**
  String get createClient;

  /// Button label to delete an item
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Button label to edit an item
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Login button label
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Button label to refresh data
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// Button label to retry an action
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Form field label for address
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// Form field label for amount
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// Form field label for expense name
  ///
  /// In en, this message translates to:
  /// **'Expense Name'**
  String get expenseName;

  /// Form field label for name
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Form field label for password
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Form field label for phone number
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// Form field label for product name
  ///
  /// In en, this message translates to:
  /// **'Product Name'**
  String get productName;

  /// Form field label for profit margin
  ///
  /// In en, this message translates to:
  /// **'Profit Margin'**
  String get profitMargin;

  /// Form field label for quantity
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// Form field label for secret word (username)
  ///
  /// In en, this message translates to:
  /// **'Secret Word'**
  String get secretWord;

  /// Form field label for sell price
  ///
  /// In en, this message translates to:
  /// **'Sell Price'**
  String get sellPrice;

  /// Form field label for username
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// Date format hint text
  ///
  /// In en, this message translates to:
  /// **'dd.MM.yyyy'**
  String get dateFormat;

  /// Price hint text and table column
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// Product hint text and table column
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get product;

  /// Quantity abbreviation hint text
  ///
  /// In en, this message translates to:
  /// **'Qty'**
  String get qty;

  /// Warehouse hint text for dropdown
  ///
  /// In en, this message translates to:
  /// **'Warehouse'**
  String get warehouseHint;

  /// Dialog title for delete confirmation
  ///
  /// In en, this message translates to:
  /// **'Confirm Delete'**
  String get confirmDelete;

  /// Dialog message for delete confirmation
  ///
  /// In en, this message translates to:
  /// **'Are you sure to delete this item?'**
  String get deleteConfirmationMessage;

  /// Validation error message for empty fields
  ///
  /// In en, this message translates to:
  /// **'Please Enter Value'**
  String get pleaseEnterValue;

  /// Table column header for actions
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get action;

  /// Table column header for actual price
  ///
  /// In en, this message translates to:
  /// **'Actual Price'**
  String get actualPrice;

  /// Table column header for stock
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get stock;

  /// Table column header for total
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// Drawer title
  ///
  /// In en, this message translates to:
  /// **'App Drawer'**
  String get appDrawer;

  /// Drawer menu item for home
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Drawer menu item for logout
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Drawer menu item for orders and screen title
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// Drawer menu item for settings
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Dialog title for selecting app language
  ///
  /// In en, this message translates to:
  /// **'Choose language'**
  String get chooseLanguage;

  /// English language label
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Russian language label
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get russian;

  /// Validation error message for required fields
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// Validation error message for empty fields
  ///
  /// In en, this message translates to:
  /// **'This field cannot be empty'**
  String get fieldCannotBeEmpty;

  /// Placeholder text for search input
  ///
  /// In en, this message translates to:
  /// **'Search by name'**
  String get searchByName;

  /// Hint text for dropdown selections
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// Prefix text for input field hints
  ///
  /// In en, this message translates to:
  /// **'Enter'**
  String get enter;

  /// Title for edit client screen
  ///
  /// In en, this message translates to:
  /// **'Edit Client'**
  String get editClient;

  /// Success message for creation
  ///
  /// In en, this message translates to:
  /// **'Successfully created'**
  String get successfullyCreated;

  /// Success message for deletion
  ///
  /// In en, this message translates to:
  /// **'Successfully deleted'**
  String get successfullyDeleted;

  /// Success message for update
  ///
  /// In en, this message translates to:
  /// **'Successfully updated'**
  String get successfullyUpdated;

  /// Success message for order creation
  ///
  /// In en, this message translates to:
  /// **'Order created successfully'**
  String get orderCreatedSuccessfully;

  /// Success message for order update
  ///
  /// In en, this message translates to:
  /// **'Order updated successfully'**
  String get orderUpdatedSuccessfully;

  /// Success message for order deletion
  ///
  /// In en, this message translates to:
  /// **'Order deleted successfully'**
  String get orderDeletedSuccessfully;

  /// Dashboard card label for total clients
  ///
  /// In en, this message translates to:
  /// **'Total Clients'**
  String get totalClients;

  /// Dashboard card label for total orders
  ///
  /// In en, this message translates to:
  /// **'Total Orders'**
  String get totalOrders;

  /// Dashboard card label for total revenue
  ///
  /// In en, this message translates to:
  /// **'Total Revenue'**
  String get totalRevenue;

  /// Dashboard card label for unpaid invoices
  ///
  /// In en, this message translates to:
  /// **'Unpaid Invoices'**
  String get unpaidInvoices;

  /// Order status - accepted
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get acceptedStatus;

  /// Order status - rejected
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get rejectedStatus;

  /// Order status - paid
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paidStatus;

  /// Order status - unpaid
  ///
  /// In en, this message translates to:
  /// **'Unpaid'**
  String get unpaidStatus;

  /// Order status label for paid orders
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paidOrder;

  /// Order status label for prepaid orders
  ///
  /// In en, this message translates to:
  /// **'Prepaid'**
  String get prepaidOrder;

  /// Order status label for unpaid orders
  ///
  /// In en, this message translates to:
  /// **'Unpaid'**
  String get unpaidOrder;

  /// Order status label for cancelled orders
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelledOrder;

  /// Order status label for refunded orders
  ///
  /// In en, this message translates to:
  /// **'Refunded'**
  String get refundedOrder;

  /// Label for selecting all items in a filter
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// Product status label for incoming products
  ///
  /// In en, this message translates to:
  /// **'Coming'**
  String get comingProduct;

  /// Product status label for existing products
  ///
  /// In en, this message translates to:
  /// **'Exists'**
  String get existsProduct;

  /// Table column header for number/index
  ///
  /// In en, this message translates to:
  /// **'number'**
  String get number;

  /// Table column header for date
  ///
  /// In en, this message translates to:
  /// **'date'**
  String get date;

  /// Table column header for order date
  ///
  /// In en, this message translates to:
  /// **'order date'**
  String get orderDate;

  /// Table column header for delivery date
  ///
  /// In en, this message translates to:
  /// **'delivery date'**
  String get deliveryDate;

  /// Table column header for actual quantity
  ///
  /// In en, this message translates to:
  /// **'actual qty'**
  String get actualQty;

  /// Table column header for warehouse quantity
  ///
  /// In en, this message translates to:
  /// **'warehouse qty'**
  String get warehouseQty;

  /// Table column header for total amount
  ///
  /// In en, this message translates to:
  /// **'total amount'**
  String get totalAmount;

  /// Table column header for paid amount
  ///
  /// In en, this message translates to:
  /// **'paid amount'**
  String get paidAmount;

  /// Table column header for debt
  ///
  /// In en, this message translates to:
  /// **'debt'**
  String get debt;

  /// Dashboard card stat indicator text
  ///
  /// In en, this message translates to:
  /// **'for this month'**
  String get forThisMonth;

  /// Month name - November
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get november;

  /// Month name - December
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get december;

  /// Button label to add an order item
  ///
  /// In en, this message translates to:
  /// **'Add Item'**
  String get addItem;

  /// Button label to confirm an action
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// Unit label for quantities
  ///
  /// In en, this message translates to:
  /// **'units'**
  String get units;

  /// Button label to change an image
  ///
  /// In en, this message translates to:
  /// **'Change image'**
  String get changeImage;

  /// Message displayed when no data is available
  ///
  /// In en, this message translates to:
  /// **'No Data Found'**
  String get dataNotFound;

  /// Hint text for date input fields
  ///
  /// In en, this message translates to:
  /// **'dd.MM.yyyy'**
  String get dateHint;

  /// Filter dropdown label for status
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// Filter field label for start date
  ///
  /// In en, this message translates to:
  /// **'From date'**
  String get fromDate;

  /// Filter field label for end date
  ///
  /// In en, this message translates to:
  /// **'To date'**
  String get toDate;

  /// Button label to reset filters
  ///
  /// In en, this message translates to:
  /// **'Reset filter'**
  String get resetFilter;

  /// Dialog title for creating a new warehouse
  ///
  /// In en, this message translates to:
  /// **'Create Warehouse'**
  String get createWarehouse;

  /// Dialog title for editing a warehouse
  ///
  /// In en, this message translates to:
  /// **'Edit Warehouse'**
  String get editWarehouse;

  /// Dialog title for adding a warehouse product
  ///
  /// In en, this message translates to:
  /// **'Add Ware Product'**
  String get addWareProduct;

  /// Dialog title for editing a warehouse product
  ///
  /// In en, this message translates to:
  /// **'Edit Ware Product'**
  String get editWareProduct;

  /// Screen title for creating a new order
  ///
  /// In en, this message translates to:
  /// **'Create Order'**
  String get createOrder;

  /// Screen title for editing an order
  ///
  /// In en, this message translates to:
  /// **'Edit Order'**
  String get editOrder;

  /// Form field label for client dropdown
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get client;

  /// Form field label for paid amount input
  ///
  /// In en, this message translates to:
  /// **'Paid Amount'**
  String get paidAmountField;

  /// Form field label for delivery date
  ///
  /// In en, this message translates to:
  /// **'Delivery On'**
  String get deliveryOn;

  /// The title for the product expense screen
  ///
  /// In en, this message translates to:
  /// **'{title} Product Expense'**
  String expDialogTitle(String title);

  /// Label for displaying total amount with currency
  ///
  /// In en, this message translates to:
  /// **'Total Amount: \$ {amount}'**
  String totalAmountLabel(String amount);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
