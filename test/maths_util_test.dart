import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_learn/maths_util.dart';

//todo 2 diawali dengan main
void main() {
  // todo 3 memulai dengan test()
  test('cek untuk penjumlahan dua angka', () {
    // Arrange todo 4 deklarasi object
    int a = 10;
    int b = 10;

    // Act todo 5 aksi untuk testing method
    int tam = tambah(a, b);

    // Assert todo 6 hasil yg diharapkan dari testing
    expect(tam, 20);
  });

  // grouping // todo 7 grouping testing (finish)
  group('cek pengurangan dan perkalian dua angka', () {
    test('cek pengurangan dua angka', () {
      // Arrange
      int a = 10;
      int b = 10;

      // Act
      int kur = kurang(a, b);

      // Asserts
      expect(kur, 0);
    });

    test('cek perkalian dua angka', () {
      // Arrange
      int a = 10;
      int b = 10;

      // Act
      int kal = kali(a, b);

      // Asserts
      expect(kal, 100);
    });
  });
}
