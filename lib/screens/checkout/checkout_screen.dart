
import 'package:everything/blocs/checkout/checkout_bloc.dart';
import 'package:everything/widgets/custom_appbar.dart';
import 'package:everything/widgets/custom_navbar.dart';
import 'package:everything/widgets/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    return Scaffold(resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(tittle: 'Checkout',),
      bottomNavigationBar: CustomNavBar(screen: routName,),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Expanded(
          child: SingleChildScrollView(
            child: BlocBuilder<CheckoutBloc, CheckoutState>(
  builder: (context, state) {

    if (state is CheckoutLoading) {
      return Center(child: CircularProgressIndicator(),);
    }
    if (state is CheckoutLoaded) {
      return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('CUSTOMER INFORMATION',style: Theme.of(context).textTheme.headline6,),

          _buildTextFromField((value){
            context.read<CheckoutBloc>().add(UpdateCheckout(email: value));
          } , context , 'Email'),
          _buildTextFromField((value){
            context.read<CheckoutBloc>().add(UpdateCheckout(fullName: value));
          }, context , 'Name'),
          Text('DELIVERY INFORMATION',style: Theme.of(context).textTheme.headline6,),
          _buildTextFromField((value){
            context.read<CheckoutBloc>().add(UpdateCheckout(address: value));
          } , context , 'Address'),
          _buildTextFromField((value){
            context.read<CheckoutBloc>().add(UpdateCheckout(city: value));
          } , context , 'City'),
          _buildTextFromField((value){
            context.read<CheckoutBloc>().add(UpdateCheckout(country: value));
          } , context , 'Country'),
          _buildTextFromField((value){
            context.read<CheckoutBloc>().add(UpdateCheckout(zipCode: value));
          } , context , 'Zip Code'),


          Text('ORDER SUMMARY',style: Theme.of(context).textTheme.headline6,),
          OrderSummary(),
        ],
      );
    }
    else{
       return Text('Something Went Wrong');
    }

  },
),
          ),
        ),
      ),
    );
  }
  Padding _buildTextFromField(
      Function(String)?onChanged,
      BuildContext context,
      String labelText,
      ){
  return Padding(padding: const EdgeInsets.all(8.0),
    child: Row(children: [
      SizedBox(width: 75,child: Text(labelText,style: Theme.of(context).textTheme.bodyText2,),),
      Expanded(child: TextFormField(onChanged: onChanged, decoration: InputDecoration(isDense: true,
      contentPadding: EdgeInsets.only(left: 10),focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))
      ),))
    ],),
  );
  }
}
