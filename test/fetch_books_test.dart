import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_learn/fetch_books.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'fetch_books_test.mocks.dart';

@GenerateMocks([
  //todo 1
  http.Client,
])
void main() {
  group('Fetch books Api class test', () {
    //todo 3
    test('Testing harus berisi respon list Books ketika panggil api berhasil',
        () async {
      //Arrange
      final mockClient = MockClient();
      when(mockClient.get(Uri.parse(fetchBooksURL))).thenAnswer(
        (realInvocation) async => http.Response(
          '[{"name" : "The 5 Second Rule","auther" : "Mel Robbins"}]',
          200,
        ),
      );

      // Act & Assert
      expect(await fetchBooks(mockClient), isA<List<BooksListModel>>());
    });

    //todo 4 (finish)
    test('Testing harus berisi respon throw Books ketika panggil api gagal',
        () async {
      //Arrange
      final mockClient = MockClient();
      when(mockClient.get(Uri.parse(fetchBooksURL))).thenAnswer(
        (realInvocation) async => http.Response(
          'Not Found',
          404,
        ),
      );

      // Act & Assert
      expect(fetchBooks(mockClient), throwsException);
    });
  });
}

//todo 2
// flutter pub run build_runner build
