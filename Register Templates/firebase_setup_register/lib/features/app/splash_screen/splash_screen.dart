import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;

  const SplashScreen({super.key, required this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  /*
    Bu initState fonksiyonu, bir StatefulWidget'in durumunu başlatmak için kullanılır. Burada ise, Future.delayed fonksiyonu ile belirli bir süre geciktirilmiş bir işlem gerçekleştiriliyor. Kod içindeki işlem şu adımlardan oluşuyor:

    Future.delayed fonksiyonu, içine verilen süre kadar bekledikten sonra bir işlem yapmasını sağlar. Bu durumda 3 saniye bekleniyor.

    Bekleme süresi sona erdiğinde, Navigator.pushAndRemoveUntil fonksiyonu ile yeni bir sayfa ekranına geçiş yapılıyor. Navigator.pushAndRemoveUntil, mevcut sayfayı (veya ekranı) kaldırarak yeni sayfaya geçişi sağlar.

    Yeni sayfa, MaterialPageRoute ile tanımlanıyor. Bu sayfa, widget.child olarak belirtilen widget'in içeriğini gösteriyor. widget.child! ifadesi, widget özelliğinin null olmadığını varsayarak kullanılır.

    Navigator.pushAndRemoveUntil fonksiyonunun ikinci parametresi olan (route) => false, mevcut sayfanın kaldırılmasını sağlar. Yani, yeni sayfa ekranına geçildikten sonra geri tuşuna basıldığında bir önceki sayfaya dönülemeyecek.

    Bu kod, belirli bir süre sonra başka bir ekran göstermek için kullanılabilir. Örneğin, uygulama başladığında bir giriş ekranı gösterildikten sonra belirli bir süre sonra ana ekran gösterilmek isteniyorsa bu tür bir işlem gerçekleştirilebilir.
  */

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget.child!,
        ),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Flutter Firebase Register',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Welcome to flutter firebase",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
