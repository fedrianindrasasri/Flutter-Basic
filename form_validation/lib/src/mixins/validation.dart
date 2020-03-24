class Validation {
  String validatePassword(String value) {
    if (value.length < 6) {
      return 'Password Minimal 6 Karakter';
    }
    return null; //selainnya lulus
  }

  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'Email Tidak Valid';
    }
    return null;
  }

  String validateName(String value) {
    if (value.isEmpty) {
      return 'Nama Lengkap Harus Diisi';
    }
    return null;
  }
}
