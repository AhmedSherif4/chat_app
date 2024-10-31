
class AppValidation {
  static emailValidation() => (String? email) {
        if (email!.isEmpty) {
          return 'برجاء كتابة البريد الالكتروني';
        } else if (!RegExp(
                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
            .hasMatch(email.trim())) {
          return 'البريد الالكتروني غير صحيح';
        }
      };





  static phoneValidation() => (String? emailOrPhone) {
        if (emailOrPhone!.isEmpty) {
          return 'برجاء كتابة رقم الجوال';
        }
        else if (!RegExp(
                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                .hasMatch(emailOrPhone) &&
            !RegExp(r"^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$")
                .hasMatch(emailOrPhone)) {
          return 'رقم الجوال غير صحيح';
        }
      };

  static passwordValidation() => (String? password) {
    if (password!.isEmpty) {
      return 'برجاء كتابة كلمة المرور';
    }
  };
  static phoneNumberValidation() => (String? phone) {
        if (phone!.isEmpty) {
          return 'برجاء كتابة رقم الجوال';
        } else if (phone.length < 7) {
          return 'رقم الجوال يجب أن يكون على الاقل 7 أرقام';
        } else if (!RegExp(r'^\d+$').hasMatch(phone)) {
          return 'رقم الجوال غير صحيح';
        }
      };

  static nameValidation() => (value) {
    if (value == null || value.isEmpty) {
      return 'برجاء كتابة الاسم بالكامل.';
    }
  };

}
