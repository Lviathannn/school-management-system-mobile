import 'package:get/get.dart';

class ValidationController extends GetxController {
  var email = "".obs;
  var password = "".obs;
  var emailError = "".obs;
  var passwordError = "".obs;
  var isFormValid = false.obs;

  @override
  void onInit() {
    super.onInit();

    ever(email, (_) => validateEmail());

    ever(password, (_) => validatePassword());

    everAll([emailError, passwordError], (_) {
      isFormValid.value =
          emailError.value.isEmpty && passwordError.value.isEmpty;
    });
  }

  void validateEmail() {
    if (email.isEmpty) {
      emailError.value = "Email tidak boleh kosong!";
    } else if (!GetUtils.isEmail(email.value)) {
      emailError.value = "Email tidak valid!";
    } else {
      emailError.value = "";
    }
  }

  void validatePassword() {
    if (password.isEmpty) {
      passwordError.value = "Password tidak boleh kosong!";
    } else if (password.value.length < 6) {
      passwordError.value = "Password harus lebih dari 6 karakter!";
    } else {
      passwordError.value = "";
    }
  }
}
