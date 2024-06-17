import 'package:flutter/material.dart';

class FormContainerWidget extends StatefulWidget {
  // Form alanındaki metni kontrol etmek için bir TextEditingController
  final TextEditingController? controller;

  // Form alanını benzersiz bir anahtarla tanımlayan bir Key nesnesi
  final Key? fieldKey;

  // Form alanının bir şifre alanı olup olmadığını belirten boolean değeri
  final bool? isPasswordField;

  // Form alanına girilmesi beklenen değeri belirten ipucu metni
  final String? hintText;

  // Form alanının etiketini belirten metin
  final String? labelText;

  // Form alanının altında görünen yardımcı bir açıklama metni
  final String? helperText;

  final Widget? prefixIcon;

  // Form alanındaki verilerin form kaydedildiğinde ne yapılacağını belirten fonksiyon
  final FormFieldSetter<String>? onSaved;

  // Form alanına girilen değeri doğrulamak için kullanılan doğrulama fonksiyonu
  final FormFieldValidator<String>? validator;

  /*
    onFieldSubmitted, kullanıcının bir TextField içinde metin girişi yaptıktan sonra Enter tuşuna basarak onayladığı veya metni gönderdiği durumu işlemek üzere bir fonksiyonu temsil eder. Bu fonksiyon, bir String parametre alır, bu da kullanıcının girdiği metni içerir.
  */
  final ValueChanged<String>? onFieldSubmitted;

  // Form alanına hangi türde veri girilebileceğini belirten TextInputType değeri
  final TextInputType? inputType;

  const FormContainerWidget({
    super.key,
    this.controller,
    this.fieldKey,
    this.isPasswordField,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
    this.prefixIcon,
  });

  @override
  State<FormContainerWidget> createState() => _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      // Widget'ın genişliğini ekranın genişliği kadar genişletir
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.35),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        style: const TextStyle(color: Colors.blue),
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldKey,
        obscureText: widget.isPasswordField == true ? _obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.black45),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: widget.isPasswordField == true
              ? Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: _obscureText == false ? Colors.blue : Colors.grey,
                )
              : const Text(""),
          ),
          prefixIcon: widget.prefixIcon,
        ),
      ),
    );
  }
}
