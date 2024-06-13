import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay/widgets.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayPage extends StatefulWidget {
  const RazorPayPage({super.key});

  @override
  State<RazorPayPage> createState() => _RazorPayPageState();
}

class _RazorPayPageState extends State<RazorPayPage> {
  late Razorpay _razorpay;
  final _formKey = GlobalKey<FormState>();
  TextEditingController amtController = TextEditingController();

  void openCheckout(int amount) async {
    amount = amount * 100; 
    var options = {
      'key': 'rzp_test_1DP5mm0lF5G5ag',
      'amount': amount,
      'name': 'Payment Gateway in Flutter',
      'prefill': {'contact': '1234567890', 'email': 'test@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Payment successful: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment failed: " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "External Wallet: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 100),
              Image.network(
                'https://entrackr.com/storage/2023/12/Razorpay-cashfree.jpg',
                height: 100,
                width: 300,
              ),
              SizedBox(height: 10),
              Textwidget(),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextformfieldWidget(amtController: amtController),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {                                                                                                    
                  if (_formKey.currentState?.validate()?? false) {
                    int amount = int.parse(amtController.text);
                    openCheckout(amount);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Make Payment"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Textwidget extends StatelessWidget {
  const Textwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Welcome to Razorpay Integration",
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18),
      textAlign: TextAlign.center,
    );
  }
}

