import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_motion/app/common/custom_navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tubes_motion/app/common/widgets/dream_item_wiget.dart';

import '../controllers/dream_controller.dart';

class DreamView extends StatelessWidget {
  final DreamController controller = Get.put(DreamController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('My Dream At Motion',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('dream').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final dreams = snapshot.data?.docs ?? [];
                  if (dreams.isEmpty) {
                    return const Center(child: Text("Belum ada Mimpi"));
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: dreams.length,
                    itemBuilder: (context, index) {
                      final document = dreams[index];
                      return DreamItemWidget(
                        id: document.id,
                        name: document.data()['text'],
                        status: document.data()['status'],
                        onDelete: controller.deleteDream,
                        onToggle: controller.toggleDream,
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Tulis Mimpi Mu!',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: controller.createDream,
                    child: const Icon(Icons.add),
                    backgroundColor: const Color.fromARGB(255, 64, 70, 251),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0
          ? controller.floatingActionButton
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavbar(),
    );
  }
}
