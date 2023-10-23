import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class OrderService {
  Future<void> placeOrder(
      String package,
      String fragrance,
      String detergent,
      String pickDate,
      String pickTime,
      String dropDate,
      String dropTime,
      String notes,
      String payIntent,
      String userAddress,
      String price) async {
    // Push a new order to the 'orders' node, Firebase will generate a unique key
    final User? user = FirebaseAuth.instance.currentUser;
    DateTime now = DateTime.now();

    // Format the DateTime object to display time with AM/PM
    String formattedTime = DateFormat('h:mm a').format(now);
    final userId = user!.uid;
    final DatabaseReference database =
        FirebaseDatabase.instance.ref().child('Orders List');
    await database.push().set({
      'package': package,
      'fragrance': fragrance,
      'detergent': detergent,
      'pickDate': pickDate,
      'pickTime': pickTime,
      'dropDate': dropDate,
      'dropTime': dropTime,
      'price': price,
      'notes': notes,
      'userId': userId,
      'datetimeEtc': payIntent,
      'status': 'pending',
      'address': userAddress,
      'time of order place':
          '${DateTime.now().day}:${DateTime.now().month}:${DateTime.now().year} At $formattedTime',
    });
  }
}
