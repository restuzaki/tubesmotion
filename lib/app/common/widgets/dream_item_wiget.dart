import 'package:flutter/material.dart';

class DreamItemWidget extends StatelessWidget {
  final String id;
  final String name;
  final bool status;
  final void Function(String) onDelete;
  final void Function(String, bool) onToggle;

  const DreamItemWidget({
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
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: () => onToggle(id, status),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: Colors.white,
        leading: GestureDetector(
          onTap: () => onToggle(id, status),
          child: Icon(
            status ? Icons.check_box : Icons.check_box_outline_blank,
            color: const Color(0xFF5F52EE),
          ),
        ),
        title: Text(
          name,
          style: TextStyle(
              fontSize: 16,
              color: const Color(0xFF3A3A3A),
              decoration: status ? TextDecoration.lineThrough : null),
        ),
        trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => onDelete(id)),
      ),
    );
  }
}
