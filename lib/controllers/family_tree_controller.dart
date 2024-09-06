import 'package:get/get.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/family_member_model.dart';

class FamilyTreeController extends GetxController {
  var familyMembers = <FamilyMember>[].obs;

  Future<void> loadFamilyData() async {
    try {
      final csvData = await rootBundle.loadString('assets/family_data.csv');
      List<List<dynamic>> csvTable =
          const CsvToListConverter().convert(csvData);

      // Skip header row and convert to FamilyMember objects
      familyMembers.assignAll(csvTable.skip(1).map((row) {
        return FamilyMember.fromCsv(row);
      }).toList());

      // Debug: Print the number of family members loaded
      print('Loaded ${familyMembers.length} family members');
    } catch (e) {
      print('Error loading CSV data: $e');
    }
  }

  // Get the children for a particular parent
  List<FamilyMember> getChildren(int parentId) {
    return familyMembers
        .where((member) => member.parentId == parentId)
        .toList();
  }
}
