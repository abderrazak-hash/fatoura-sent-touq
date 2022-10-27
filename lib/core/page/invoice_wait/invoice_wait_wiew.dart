import 'package:cloud_toq_system/core/common/theme/app_assets.dart';
import 'package:cloud_toq_system/core/common/theme/app_colors.dart';
import 'package:cloud_toq_system/core/common/translation/app_text.dart';
import 'package:cloud_toq_system/utils/empty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceWaitView extends StatelessWidget {
   InvoiceWaitView({Key? key}) : super(key: key);

   List<Invoice> invoices =[
     Invoice(
       number: 1,
       total: 120.00,
     ),
     Invoice(
       number: 2,
       total: 120.00,
     ),
     Invoice(
       number: 3,
       total: 120.00,
     ),
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppAssets.background_app),
          Column(
            children: [
              _buildToolbar(),
              _buildInvoiceWait(),
            ],
          ),
        ],
      ),
    );
  }
  AppBar _buildToolbar() {
    return AppBar(
      title: Text(AppText.invoiceWait,
        style: TextStyle(
          fontFamily: 'Tajawal',
          fontSize: 16,
          color: AppColors.current.success,
          fontWeight: FontWeight.w500,
        ),
      ),
      leadingWidth: 48,
      leading:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.current.success,
                  width: 2
              )
          ),
          child: Text('3',style: TextStyle(
            color: AppColors.current.success
          ),),
        ),
      ) ,
      actions: [
        GestureDetector(
            onTap: ()=>Get.back(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.arrow_forward,
                color: AppColors.current.success,
                size: 36,
              ),
            ))
      ],
    );
  }
 Widget _buildInvoiceWait(){
    return Expanded(
      child: ListView.builder(
          itemCount: invoices.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 96,
                decoration: BoxDecoration(
                  color: index==0?AppColors.current.success:AppColors.current.neutral,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 2,
                    color: AppColors.current.primary,
                  ),
                ),
                child: ListTile(
                  title: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 6),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(AppAssets.item,)
                          )
                        ),
                        child: Text(invoices[index].number.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            fontFamily: 'Tajawal',
                            color: AppColors.current.primary,
                          ),
                        ),
                      ),
                      Empty(width: 8,),
                      VerticalDivider(
                          width: 1,
                          color: AppColors.current.primary,
                          thickness: 1,
                      indent: 16,
                      endIndent: 16,),
                      Empty(width: 8,),
                      Text('إجمالى الفاتورة',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: 'Tajawal',
                        color: AppColors.current.text,
                      ),
                      ),
                      const Spacer(flex: 1,),
                      Text(invoices[index].total.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          fontFamily: 'Tajawal',
                          color: AppColors.current.primary,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
 }

}
class Invoice{
  int? number;
  double? total;

  Invoice({this.number, this.total});
}