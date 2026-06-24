// ─────────────────────────────────────────────────────────────────────────
// SOLUTIONS — Encapsulation
// ─────────────────────────────────────────────────────────────────────────
import 'dart:io';

void main() {
  print('── Exercise 1 ──────────────────────────');
  exercise1();
  print('\n── Exercise 2 ──────────────────────────');
  exercise2();
}

// ══════════════════════════════════════════════════════════════════
// Exercise 1 — Validated Profile  🟢
// ══════════════════════════════════════════════════════════════════

class UserProfile {
  String _username;
  String _email;
  int    _age;

  UserProfile(this._username, this._email, this._age);

  String get username => _username;
  String get email    => _email;
  int    get age      => _age;

  set username(String value) {
    if (value.trim().length < 3) {
      print('  Username must be at least 3 characters');
      return;
    }
    _username = value;
  }

  set email(String value) {
    if (!value.contains('@')) {
      print('  Email must contain @');
      return;
    }
    _email = value;
  }

  set age(int value) {
    if (value < 0 || value > 120) {
      print('  Age must be between 0 and 120');
      return;
    }
    _age = value;
  }

  @override
  String toString() => 'User: $_username | Email: $_email | Age: $_age';
}

void exercise1() {
  stdout.write('Username: '); String u = stdin.readLineSync() ?? 'user';
  stdout.write('Email: ');    String e = stdin.readLineSync() ?? 'a@b.com';
  stdout.write('Age: ');      int a    = int.parse(stdin.readLineSync() ?? '0');

  var profile = UserProfile(u, e, a);
  print(profile);

  // Demonstrate validation rejection with invalid values
  print('\n  Attempting invalid updates:');
  profile.username = 'ab';       // too short
  profile.email    = 'notvalid'; // no @
  profile.age      = 200;         // out of range
  print('  Profile unchanged: $profile');
}

// ══════════════════════════════════════════════════════════════════
// Exercise 2 — Temperature Gauge  🟢
// ══════════════════════════════════════════════════════════════════

class TemperatureGauge {
  double _celsius;

  TemperatureGauge(this._celsius);

  double get celsius    => _celsius;
  double get fahrenheit => (_celsius * 9 / 5) + 32;

  String get status {
    if (_celsius <= 0)  return 'Freezing';
    if (_celsius <= 15) return 'Cold';
    if (_celsius <= 28) return 'Warm';
    return 'Hot';
  }

  set celsius(double value) {
    if (value < -273.15) {
      print('  Cannot go below absolute zero (-273.15°C)');
      return;
    }
    _celsius = value;
  }
}

void exercise2() {
  stdout.write('Enter temperature in Celsius: ');
  double temp = double.parse(stdin.readLineSync() ?? '0');

  var gauge = TemperatureGauge(temp);
  print('Celsius:    ${gauge.celsius}°C');
  print('Fahrenheit: ${gauge.fahrenheit.toStringAsFixed(1)}°F');
  print('Status:     ${gauge.status}');

  // Test the setter validation
  gauge.celsius = -500; // rejected
  print('After invalid attempt — Celsius still: ${gauge.celsius}°C');
}
