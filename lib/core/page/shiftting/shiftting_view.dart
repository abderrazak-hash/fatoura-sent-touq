import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/page/open_shift/open_shift_view.dart';
import 'package:cloud_toq_system/core/page/product/product_screen.dart';
import 'package:cloud_toq_system/core/page/shiftting/shfit.dart';
import 'package:cloud_toq_system/core/page/shiftting/shift_controller.dart';
import 'package:cloud_toq_system/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShftingView extends StatelessWidget {
   ShftingView({Key? key}) : super(key: key);
   var shiftController =ShiftController();
   List<Shfit> shifts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text('اجهزة نقاط البيع',
          style: TextStyle(
              color: AppColors.current.success,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              fontFamily: 'Tajawal'
          ),
        ),

        actions: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.arrow_forward,
              size: 36,
              color: AppColors.current.success,),
            ),
            onTap:()=>Get.back(),
            // onPressed:()=>Get.offNamed(Routes.HOME),
          ),

        ],

      ),
      body: Center(
        child: FutureBuilder <List<Shfit>>(
          future:shiftController.getShift(Get.arguments['userID'],Get.arguments['BranchID']),
          builder: (context , snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(
                  ),
                );

              case ConnectionState.active:
                return const Center(
                  child: CircularProgressIndicator(
                  ),
                );

              case ConnectionState.none:
                return const Center(
                  child: Text('No Connection'),
                );

              case ConnectionState.done:
                if(snapshot.error != null){
                  return Text(snapshot.error.toString());
                }
                else {
                  if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        'لا يملك مناوبات هذا المستخدم',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Tajawal',
                            color: AppColors.current.text),
                      ),
                    );
                  }
                  else {
                    //branches = snapshot.data!;
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context , index){
                          sharedPreferences!.setString('key_branch', snapshot.data![index].brancheId.toString());
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16),
                            child: Container(
                              width: 196,
                              //height: 100,
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.current.primary,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                  children: [
                                    Text(snapshot.data![index].name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          fontFamily: 'Tajawal',
                                          color: AppColors.current.text),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                                      child: Container(
                                          width: 96,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.current.accent,
                                                width: 1
                                            ),
                                            borderRadius: BorderRadius.circular(16),
                                            color: AppColors.current.accentLight,
                                          ),
                                          child: Center(child: Text(snapshot.data![index].status,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                fontFamily: 'Tajawal',
                                                color: AppColors.current.success),
                                          ),),),
                                    ),
                                    Container(
                                      width: 164,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppColors.current.success,
                                            width: 1
                                          ),
                                          borderRadius: BorderRadius.circular(16),
                                          color: snapshot.data![index].status.contains('close')?
                                        AppColors.current.primary:AppColors.current.text.withOpacity(0.2)),
                                        child:GestureDetector(
                                            onTap: (){
                                              print('USER DIVICE ID${snapshot.data![index].id.toString()}');
                                             snapshot.data![index].status.contains('close')?
                                             Get.to(OpenShiftView(),
                                                 arguments: {
                                                   'device_id':snapshot.data![index].deviceId.toString(),
                                                   'USER_ID':snapshot.data![index].userId.toString(),
                                                   'user_device_id':snapshot.data![index].id.toString(),
                                                   'branching_id':snapshot.data![index].brancheId.toString(),
                                                 }
                                             )
                                             :null;
                                            },
                                            child:  Center(
                                              child:  Text('فتح مناوبة جديده',
                                              style: snapshot.data![index].status.contains('close')?
                                                TextStyle(
                                                  color: AppColors.current.success
                                                ):
                                              TextStyle(
                                                  color: AppColors.current.neutral
                                              )
                                              ),
                                            ),)
                                      ,),
                                  ],
                                ),

                            ),
                          );
                        });

                  }

                }
            }

          },
        ),
      ),
    );
  }
}
