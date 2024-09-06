class FamilyMember {
  final int personalId;
  final String name;
  final String fatherName;
  final int parentId;
  final String profession;
  final String dateOfBirth;
  final String? dateOfDeath;

  FamilyMember({
    required this.personalId,
    required this.name,
    required this.fatherName,
    required this.parentId,
    required this.profession,
    required this.dateOfBirth,
    this.dateOfDeath,
  });

  // Update the fromCsv method to handle type conversions properly
  factory FamilyMember.fromCsv(List<dynamic> csvRow) {
    return FamilyMember(
      personalId: int.tryParse(csvRow[0].toString()) ?? 0,
      name: csvRow[1].toString(),
      fatherName: csvRow[2].toString(),
      parentId: int.tryParse(csvRow[3].toString()) ?? 0,
      profession: csvRow[4].toString(),
      dateOfBirth: csvRow[5].toString(),
      dateOfDeath: csvRow.length > 6 ? csvRow[6]?.toString() : null,
    );
  }
}
