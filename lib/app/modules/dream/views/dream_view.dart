import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tubes_motion/app/common/custom_navbar.dart';

import '../controllers/dream_controller.dart';

class DreamView extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final DreamController controller = Get.find<DreamController>();

  void handleCreateTodo() {}

  void handleToggleTodo(String id, bool status) {}

  void handleDeleteTodo(String id) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Dream At Motion',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TodoItemWidget(
                    id: "1",
                    name: "Ini todo pertama",
                    status: true,
                    onDelete: handleDeleteTodo,
                    onToggle: handleToggleTodo,
                  ),
                  TodoItemWidget(
                    id: "2",
                    name: "Ini todo kedua",
                    status: false,
                    onDelete: handleDeleteTodo,
                    onToggle: handleToggleTodo,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 50, right: 20, left: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                          hintText: 'Tulis Mimpimu!',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 50, right: 20),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 64, 70, 251),
                    ),
                    child: TextButton(
                      onPressed: handleCreateTodo,
                      child: const Text(
                        '+',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: controller.floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavbar(),
    );
  }
}

class TodoItemWidget extends StatelessWidget {
  final String id;
  final String name;
  final bool status;
  final void Function(String) onDelete;
  final void Function(String, bool) onToggle;

  const TodoItemWidget({
    Key? key,
    required this.id,
    required this.name,
    required this.status,
    required this.onDelete,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () => onToggle(id, !status),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          status ? Icons.check_box : Icons.check_box_outline_blank,
          color: const Color(0xFF5F52EE),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontSize: 16,
            color: const Color(0xFF3A3A3A),
            decoration: status ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: const Color(0xFFDA4040),
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () => onDelete(id),
          ),
        ),
      ),
    );
  }
}
