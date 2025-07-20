import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/dashboard': (context) => DashboardPage(),
        '/profile': (context) => ProfilePage(),
        '/courses': (context) => CoursesPage(),
        '/courseDetails': (context) => CourseDetailsPage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock, size: 100, color: Colors.white),
              Text('Welcome Back!', style: TextStyle(fontSize: 24, color: Colors.white)),
              Text('Login to continue', style: TextStyle(color: Colors.white)),
              SizedBox(height: 20),
              TextField(decoration: InputDecoration(labelText: 'Email', filled: true)),
              TextField(decoration: InputDecoration(labelText: 'Password', filled: true)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
                child: Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text("Don't have an account? Sign up"),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF8B6F47),
    );
  }
}

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person_add, size: 100, color: Colors.white),
              Text('Create Account', style: TextStyle(fontSize: 24, color: Colors.white)),
              Text('Sign up to get started', style: TextStyle(color: Colors.white)),
              SizedBox(height: 20),
              TextField(decoration: InputDecoration(labelText: 'Full Name', filled: true)),
              TextField(decoration: InputDecoration(labelText: 'Email', filled: true)),
              TextField(decoration: InputDecoration(labelText: 'Password', filled: true)),
              TextField(decoration: InputDecoration(labelText: 'Confirm Password', filled: true)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
                child: Text('Sign Up'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF8B6F47),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'), backgroundColor: Color(0xFF8B6F47)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network('https://via.placeholder.com/300x100', height: 100),
            Text('Welcome back, John Doe 👋', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.person), Text('View Profile')],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/courses');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.book), Text('View Courses')],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile'), backgroundColor: Color(0xFF8B6F47)),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(radius: 50, backgroundImage: NetworkImage('https://via.placeholder.com/150')),
              Text('John Doe', style: TextStyle(fontSize: 24)),
              Text('john@example.com'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('12 Courses'),
                  Text('5 Badges'),
                  Text('23 Rank'),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
    );
  }
}

class CoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Courses'), backgroundColor: Color(0xFF8B6F47)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/courseDetails', arguments: 'Flutter Basics');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.book), Text('Flutter Basics')],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/courseDetails', arguments: 'Dart Language');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.book), Text('Dart Language')],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
    );
  }
}

class CourseDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final courseName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text(courseName), backgroundColor: Color(0xFF8B6F47)),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(courseName, style: TextStyle(fontSize: 24)),
              Text('Course Description', style: TextStyle(fontSize: 16)),
              Text('Introduction to $courseName.'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Start Course'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFFF5F5F5),
    );
  }
}