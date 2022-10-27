import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    getInfoUser();
  }

  final userName=''.obs;
  final fullName=''.obs;
  final avatar =''.obs;
  final email=''.obs;
  final mobile =''.obs;
  void getInfoUser()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userName.value = sharedPreferences.getString('UserName')!;
    fullName.value = sharedPreferences.getString('fullName')!;
    avatar.value = sharedPreferences.getString('avatar')!;
    email.value = sharedPreferences.getString('email')!;
    mobile.value = sharedPreferences.getString('mobile')!;
    print('seen============ $userName');
  }
}