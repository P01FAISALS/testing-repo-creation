import 'dart:convert';

typedef FunctionWithValue<T> = Function(T value);

class SampleData {
  String data;

  SampleData({
    required this.data,
  });

  Map<String, dynamic> toJson() => {
    'data': data,
  };

  String toJsonString() => jsonEncode(toJson());
}