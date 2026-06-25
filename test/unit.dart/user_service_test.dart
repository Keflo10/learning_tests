import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_application_1/services/user_service.dart';

// Generate mocks
@GenerateMocks([http.Client])
import 'user_service_test.mocks.dart';

void main() {
  late MockClient mockClient;
  late UserService userService;

  setUp(() {
    mockClient = MockClient();
    userService = UserService(mockClient);
  });

  group('UserService', () {
    test('should return user name when API call succeeds', () async {
      // Arrange
      when(
        mockClient.get(any),
      ).thenAnswer((_) async => http.Response('{"name": "John Doe"}', 200));

      // Act
      final result = await userService.getUserName(1);

      // Assert
      expect(result, 'John Doe');
      verify(
        mockClient.get(Uri.parse('https://api.example.com/users/1')),
      ).called(1);
    });

    test('should throw exception when API call fails', () async {
      // Arrange
      when(
        mockClient.get(any),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      // Act & Assert
      expect(() => userService.getUserName(1), throwsException);
    });
  });
}
