import 'package:flutter/material.dart';
import 'package:rawabit_delivery_app/features/language/domain/models/language_model.dart';
import 'package:rawabit_delivery_app/utill/app_constants.dart';

class LanguageRepository {
  List<LanguageModel> getAllLanguages({BuildContext? context}) {
    return AppConstants.languages;
  }
}
