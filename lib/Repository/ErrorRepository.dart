import 'dart:html';

import 'package:flutter/material.dart';

abstract class ErrorRepository {
  Future<String> setError({@required errorMessage});
}

class FakeErrorRepository implements ErrorRepository {
  @override
  Future<String> setError({@required errorMessage}) {
    return errorMessage;
  }
}
