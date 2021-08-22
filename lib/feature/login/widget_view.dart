part of 'login_page.dart';

ElevatedButton butButt({required Function funcClick, String title = 'Next'}) =>
    ElevatedButton(onPressed: () => funcClick, child: Text(title));
