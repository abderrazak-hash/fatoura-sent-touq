import 'package:cloud_toq_system/core/page/add_customer/add_customer_binding.dart';
import 'package:cloud_toq_system/core/page/auth/forget_password_email/forget_password_email_binding.dart';
import 'package:cloud_toq_system/core/page/auth/forget_password_email/forget_password_email_view.dart';
import 'package:cloud_toq_system/core/page/auth/forget_password_phone_number/forget_password_phone_number_binding.dart';
import 'package:cloud_toq_system/core/page/auth/forget_password_phone_number/forget_password_phone_number_view.dart';
import 'package:cloud_toq_system/core/page/auth/login/login_binding.dart';
import 'package:cloud_toq_system/core/page/auth/login/login_view.dart';
import 'package:cloud_toq_system/core/page/auth/middle.dart';
import 'package:cloud_toq_system/core/page/auth/new_password/new_password_binding.dart';
import 'package:cloud_toq_system/core/page/auth/new_password/new_password_view.dart';
import 'package:cloud_toq_system/core/page/auth/recover_code_sent/recover_code_binding.dart';
import 'package:cloud_toq_system/core/page/auth/recover_code_sent/recover_code_view.dart';
import 'package:cloud_toq_system/core/page/branch/branch_binding.dart';
import 'package:cloud_toq_system/core/page/branch/branch_view.dart';
import 'package:cloud_toq_system/core/page/cart/cart_screen.dart';
import 'package:cloud_toq_system/core/page/cart/cart_binding.dart';
import 'package:cloud_toq_system/core/page/invoice_items/invoice_item_view.dart';
import 'package:cloud_toq_system/core/page/invoice_items/invoice_items_binding.dart';
import 'package:cloud_toq_system/core/page/invoice_wait/invoice_wait_binding.dart';
import 'package:cloud_toq_system/core/page/invoice_wait/invoice_wait_wiew.dart';
import 'package:cloud_toq_system/core/page/item_name/item_name_binding.dart';
import 'package:cloud_toq_system/core/page/item_name/item_name_view.dart';
import 'package:cloud_toq_system/core/page/items/category/category_binding.dart';
import 'package:cloud_toq_system/core/page/items/category/category_view.dart';
import 'package:cloud_toq_system/core/page/items/category_add/category_add_binding.dart';
import 'package:cloud_toq_system/core/page/items/category_add/category_add_view.dart';
import 'package:cloud_toq_system/core/page/items/department/department_binding.dart';
import 'package:cloud_toq_system/core/page/items/department/department_view.dart';
import 'package:cloud_toq_system/core/page/items/department_add/department_add_binding.dart';
import 'package:cloud_toq_system/core/page/items/department_add/department_add_view.dart';
import 'package:cloud_toq_system/core/page/items/items_binding.dart';
import 'package:cloud_toq_system/core/page/items/items_view.dart';
import 'package:cloud_toq_system/core/page/onboarding/onboarding_binding.dart';
import 'package:cloud_toq_system/core/page/onboarding/onboarding_view.dart';
import 'package:cloud_toq_system/core/page/payment/payment_binding.dart';
import 'package:cloud_toq_system/core/page/payment/payment_view.dart';
import 'package:cloud_toq_system/core/page/product/product_binding.dart';
import 'package:cloud_toq_system/core/page/product/product_screen.dart';
import 'package:cloud_toq_system/core/page/profile/profile_binding.dart';
import 'package:cloud_toq_system/core/page/profile/profile_view.dart';
import 'package:cloud_toq_system/core/page/sales/receipts_binding.dart';
import 'package:cloud_toq_system/core/page/sales/receipts_view.dart';
import 'package:cloud_toq_system/core/page/shiftting/shiftting_view.dart';
import 'package:cloud_toq_system/core/page/side_menu/side_menu_binding.dart';
import 'package:cloud_toq_system/core/page/side_menu/side_menu_view.dart';
import 'package:cloud_toq_system/core/page/splash/splash_binding.dart';
import 'package:cloud_toq_system/core/page/splash/splash_view.dart';
import 'package:get/get.dart';
import '../page/add_customer/add_customer_view.dart';
part 'app_routes.dart';

const _pageTransition = Transition.downToUp;
const _transitionDuration = Duration(milliseconds:400);

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_VIEW;

  static final routes = [
    GetPage(
        name: _Paths.SPLASH_VIEW,
        page: () => SplashView(),
        binding: SplashBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration,
     middlewares: [MiddleWare()],
     // middlewares: [MiddleWare()],
    ),
    GetPage(
        name: _Paths.ONBOARDING_VIEW,
        page: () => OnBoardingScreen(),
        binding: OnBoardingBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration,
        middlewares: [MiddleWare2()],
    ),
    GetPage(
        name: _Paths.LOGIN,
        page: () => LoginView(),
        binding: LoginBinding(),
        middlewares: [MiddleWare3()],
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => ForgetPasswordEmailView(),
      binding: ForgetPasswordEmailBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD_PHONE_NUMBER,
      page: () => ForgetPasswordPhoneNumberView(),
      binding: ForgetPasswordPhoneNumberBinding(),
    ),
    GetPage(
      name: _Paths.RECOVER_CODE,
      page: () => RecoverCodeView(),
      binding: RecoverCodeBinding(),
    ),
    GetPage(
      name: _Paths.NEW_PASSWORD,
      page: () => NewPasswordView(),
      binding: NewPasswordBinding(),
    ),

    GetPage(
      name: _Paths.SIDEMENU,
      page: () => SideMenuView(),
      binding: SideMenuBinding(),
    ),

    GetPage(
      name: _Paths.INVOICEWAIT,
      page: () => InvoiceWaitView(),
      binding: InvoiceWaitBinding(),
        transition: _pageTransition,
        transitionDuration: _transitionDuration
    ),
    GetPage(
      name: _Paths.INVOICEITEMS,
      page: () => InvoiceItemView(),
      binding: InvoiceItemsBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentView(),
      binding: PaymentBinding(),
    ),

    GetPage(
      name: _Paths.ITEMS,
      page: () => ItemsView(),
      binding: ItemsBinding(),
    ),
    GetPage(
      name: _Paths.RECEIPTS,
      page: () => ReceiptsView(),
      binding: ReceiptsBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.DEPARTMENT,
      page: () => DepartmentView(),
      binding: DepartmentBinding(),
    ),
    GetPage(
      name: _Paths.DEPARTMENTADD,
      page: () => DepartmentAddView(),
      binding: DepartmentAddBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORYADD,
      page: () => CategoryAddView(),
      binding: CategoryAddBinding(),
    ),
    GetPage(
      name: _Paths.ADDCUSTOMER,
      page: () => AddCustomerView(),
      binding: AddCustomerBinding(),
      transition: Transition.downToUp
    ),
    GetPage(
        name: _Paths.ITEMNAME,
        page: () => ItemNameView(),
        binding: ItemNameBinding(),
        transition: Transition.downToUp
    ),
    GetPage(
        name: _Paths.PRODUCT,
        page: () => ProductListScreen(),
        binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.BRANCH,
      page: () => BranchView(),
      binding: BranchBinding(),
      middlewares: [MiddleWare4()],
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SHIFT,
      page: () => ShftingView(),
      binding: ProfileBinding(),
      //middlewares: [MiddleWare4()],
    ),
  ];
}


