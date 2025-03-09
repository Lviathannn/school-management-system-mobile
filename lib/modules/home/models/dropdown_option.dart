class DropdownOption {
  final String value;
  final String label;

  DropdownOption({required this.value, required this.label});

  factory DropdownOption.fromJson(Map<String, dynamic> json) {
    return DropdownOption(
      value: json['id'],
      label: json['name'],
    );
  }
}
