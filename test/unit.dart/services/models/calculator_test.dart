import 'package:flutter_application_1/models/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Calculator calculator;

  // Setup runs before each test
  setUp(() {
    calculator = Calculator();
  });

  group('Calculator - Addition', () {
    test('should add two positive numbers', () {
      // Arrange
      const a = 5;
      const b = 3;

      // Act
      final result = calculator.add(a, b);

      // Assert
      expect(result, 8);
    });

    test('should add negative numbers', () {
      expect(calculator.add(-5, -3), -8);
    });
  });

  group('Calculator - Division', () {
    test('should divide two numbers', () {
      expect(calculator.divide(10, 2), 5.0);
    });

    test('should throw error when dividing by zero', () {
      expect(() => calculator.divide(10, 0), throwsArgumentError);
    });
  });
}
