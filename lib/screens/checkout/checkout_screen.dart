
import 'package:everything/widgets/custom_appbar.dart';
import 'package:everything/widgets/custom_navbar.dart';
import 'package:everything/widgets/order_summary.dart';
import 'package:flutter/material.dart';
class CheckoutScreen extends StatelessWidget {
static const String routName = '/checkout';

static Route route(){
  return MaterialPageRoute(
    settings: RouteSettings(name: routName),
    builder: (context)=>CheckoutScreen(),
  );
}

  @override
  Widget build(BuildContext context) {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();

    return Scaffold(resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(tittle: 'Checkout',),
      bottomNavigationBar: CustomNavBar(screen: routName,),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('CUSTOMER INFORMATION',style: Theme.of(context).textTheme.headline6,),

                _buildTextFromField(emailController , context , 'Email'),
                _buildTextFromField(nameController , context , 'Name'),
                Text('DELIVERY INFORMATION',style: Theme.of(context).textTheme.headline6,),
                _buildTextFromField(addressController , context , 'Address'),
                _buildTextFromField(cityController , context , 'City'),
                _buildTextFromField(cityController , context , 'Country'),
                _buildTextFromField(zipCodeController , context , 'Zip Code'),


                Text('ORDER SUMMARY',style: Theme.of(context).textTheme.headline6,),
                OrderSummary(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Padding _buildTextFromField(
      TextEditingController controller,
      BuildContext context,
      String labelText,
      ){
  return Padding(padding: const EdgeInsets.all(8.0),
    child: Row(children: [
      SizedBox(width: 75,child: Text(labelText,style: Theme.of(context).textTheme.bodyText2,),),
      Expanded(child: TextFormField(controller: controller,decoration: InputDecoration(isDense: true,
      contentPadding: EdgeInsets.only(left: 10),focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))
      ),))
    ],),
  );
  }
}
