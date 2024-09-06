import 'package:flutter/material.dart';
import '../models/family_member_model.dart';
import '../controllers/family_tree_controller.dart';
import 'package:get/get.dart';

class FamilyTreeWidget extends StatelessWidget {
  final FamilyMember member;

  const FamilyTreeWidget({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    final FamilyTreeController controller = Get.find<FamilyTreeController>();
    final children = controller.getChildren(member.personalId);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Parent (root node or intermediate parent)
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                member.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (member.profession.isNotEmpty)
                Text(
                  'Profession: ${member.profession}',
                  style: const TextStyle(fontSize: 12),
                ),
              if (member.dateOfBirth.isNotEmpty)
                Text(
                  'Born: ${member.dateOfBirth}',
                  style: const TextStyle(fontSize: 12),
                ),
              if (member.dateOfDeath != null)
                Text(
                  'Died: ${member.dateOfDeath}',
                  style: const TextStyle(fontSize: 12),
                ),
            ],
          ),
        ),

        // Display a line to represent the connection to children
        if (children.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              height: 20,
              width: 2,
              color: Colors.black,
            ),
          ),

        // Children rendered recursively below the parent
        if (children.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Show siblings in a row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children.map((child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: FamilyTreeWidget(member: child),
                  );
                }).toList(),
              ),
            ],
          ),
      ],
    );
  }
}
