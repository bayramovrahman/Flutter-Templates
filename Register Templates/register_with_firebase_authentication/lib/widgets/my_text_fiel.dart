import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  // İlgili metin giriş alanını kontrol etmek için bir denetleyici.
  final TextEditingController? controller;

  // Bu metin giriş alanını özel olarak tanımlamak ve belirlemek için bir anahtar.
  final Key? fieldKey;

  // Bu metin giriş alanının bir şifre girişi alanı olup olmadığını belirten bir değer.
  final bool? isPasswordField;

  // Giriş alanının içinde gösterilecek ipucu metni.
  final String? hintText;

  // Giriş alanının etiket metni.
  final String? labelText;

  // Giriş alanının yardımcı metni.
  final String? helperText;

  // Giriş alanının başına eklenen ikon veya widget.
  final Widget? prefixIcon;

  // Giriş alanındaki değeri kaydetmek için bir işlev.
  final FormFieldSetter<String>? onSaved;

  // Giriş alanındaki değeri doğrulamak için bir işlev.
  final FormFieldValidator<String>? validator;

  // Giriş alanına bir değer girildiğinde tetiklenen bir işlev.
  final ValueChanged<String>? onFieldSubmitted;

  // Giriş alanının beklediği metin türünü belirten bir değer.
  final TextInputType? inputType;

  const MyTextField({
    super.key,
    this.controller,
    this.fieldKey,
    this.isPasswordField,
    this.hintText,
    this.labelText,
    this.helperText,
    this.prefixIcon,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.grey[700]),
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: widget.inputType,
      key: widget.fieldKey,
      obscureText: widget.isPasswordField == true ? _obscureText : false,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey[500]),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade700,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: widget.isPasswordField == true
              ? Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: _obscureText == false ? Colors.black : Colors.grey,
                )
              : const Text(""),
        ),
        prefixIcon: widget.prefixIcon,
      ),
    );
  }
}
