class FixableModel{
  int flex;
  String data;

  FixableModel({this.flex, this.data});

  @override
  String toString() {
    return 'FixableModel{fix: $flex, data: $data}';
  }
}