import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetUtilsPage extends StatefulWidget {
  const GetUtilsPage({super.key});

  @override
  State<GetUtilsPage> createState() => _GetUtilsPageState();
}

class _GetUtilsPageState extends State<GetUtilsPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetUtils Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (GetUtils.isPhoneNumber(phoneController.text)) {
                  Get.snackbar('Success', 'Valid phone number');
                } else {
                  Get.snackbar('Error', 'Invalid phone number');
                }
              },
              child: const Text('Check Phone Number'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (GetUtils.isEmail(emailController.text)) {
                  Get.snackbar('Success', 'Valid email');
                } else {
                  Get.snackbar('Error', 'Invalid email');
                }
              },
              child: const Text('Check Email'),
            ),
          ],
        ),
      ),
    );
  }
}
