import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterController extends GetxController {
  final selectedGender = "".obs;
  final tempFullName = "".obs;
  final tempuserName = "".obs;
  final tempEmail = "".obs;
  final tempPassword = "".obs;
  final tempNoHp = "".obs;
  final tempPekerjaan = "".obs;
  final tempTempatLahir = "".obs;
  final tempTanggalLahir = "".obs;
  final tempNIK = "".obs;

  final isUser = true.obs;
  final isObsecureConfirm = true.obs;
  final isObsecurePassword = true.obs;

  void saveRegisterData(
      String fullName,
      String userName,
      String email,
      String password,
      String noHp,
      String pekerjaan,
      String tempatLahir,
      String tanggalLahir,
      String nik) {
    tempFullName.value = fullName;
    tempuserName.value = userName;
    tempEmail.value = email;
    tempPassword.value = password;
    tempNoHp.value = noHp;
    tempPekerjaan.value = pekerjaan;
    tempTempatLahir.value = tempatLahir;
    tempTanggalLahir.value = tanggalLahir;
    tempNIK.value = nik;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void toggleObsecureValue() {
    isObsecureConfirm.value = !isObsecureConfirm.value;
  }

  void toggleObsecurePasswrdValue() {
    isObsecurePassword.value = !isObsecurePassword.value;
  }

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  var selectedDate = DateTime.now().obs;

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  String get formattedDate =>
      DateFormat('dd-MM-yyyy').format(selectedDate.value);
}
