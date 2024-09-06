import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/family_tree_controller.dart';
import '../widgets/family_tree_widget.dart';

class FamilyTreeScreen extends StatelessWidget {
  const FamilyTreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FamilyTreeController controller = Get.put(FamilyTreeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Tree'),
      ),
      body: FutureBuilder(
        future: controller.loadFamilyData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            // Assuming the root node has parentId = 0
            final rootMembers = controller.familyMembers
                .where((member) => member.parentId == 0)
                .toList();

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: rootMembers
                      .map((member) => FamilyTreeWidget(member: member))
                      .toList(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
