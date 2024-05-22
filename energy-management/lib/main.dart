import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

enum AppFontStyle { montserrat }

class MyApp extends StatefulWidget {
  static final GlobalKey<_MyAppState> _myAppStateKey = GlobalKey<_MyAppState>();
  @override
  _MyAppState createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = of(context)!;
    state.setLocale(newLocale);
  }

  static void setFontStyle(BuildContext context, AppFontStyle fontStyle) {
    final _MyAppState? state = of(context);
    if (state != null) {
      state.setFontStyle(fontStyle);
    }
  }

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Brightness _themeMode = Brightness.light;
  Locale _locale = Locale('en', 'US');
  AppFontStyle _fontStyle = AppFontStyle.montserrat;

  String _getFontFamily() {
    switch (_fontStyle) {
      case AppFontStyle.montserrat:
        return 'montserrat';
      // Default font family
    }
  }

  void setFontStyle(AppFontStyle fontStyle) {
    setState(() {
      _fontStyle = fontStyle;
    });
  }
  // Default locale

  void setLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  void setThemeMode(Brightness brightness) {
    setState(() {
      _themeMode = brightness;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: MyApp._myAppStateKey,
      title: Intl.message('Energy conservation and management system'),
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: _themeMode,
        textTheme: _buildTextTheme(),
        fontFamily: _getFontFamily(),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/settings': (context) => SettingsPage(),
        '/threshold_fixing': (context) => ThresholdFixingPage(),
        '/create_report': (context) => CreateReportPage(),
        '/user_feedback': (context) => UserFeedbackPage(),
        '/faqs': (context) => FAQsPage(),
        '/submit_feedback': (context) => SubmitFeedbackPage(),
        '/report_problem': (context) => ReportProblemPage(),
        '/live_chat': (context) => LiveChatPage(),
        '/passwords': (context) => PasswordsPage(),
        '/registration': (context) => RegistrationPage(),
        '/customization': (context) => CustomizationPage(),
        '/language_selection': (context) => LanguageSelectionPage(),
        '/font_selection': (context) => FontSelectionPage(),
        '/energyusagebyappliances': (context) => EnergyUsageByAppliancesPage(),

        // Define other routes...
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // Add more localization delegates if required
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('es', 'ES'),
        Locale('hi', 'IN'),
        Locale('te', 'IN'),
        Locale('ta', 'IN'),
      ],
      locale: Locale('en', 'US'),
    );
  }

  TextTheme _buildTextTheme() {
    switch (_fontStyle) {
      case AppFontStyle.montserrat:
        return ThemeData().textTheme.apply(fontFamily: 'montserrat');
      default:
        return ThemeData().textTheme;
    }
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 7.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 3.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Energy Management and Conservation System',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0), // Add spacing between text and button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  "Let's Save Energy",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String data;
  final TextAlign? textAlign; // Add the textAlign parameter
  final TextStyle? style;

  const CustomText(
    this.data, {
    Key? key,
    this.textAlign, // Add this line
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String fontFamily = MyApp.of(context)!._getFontFamily();
    return Text(
      data,
      textAlign: textAlign, // Use the textAlign parameter
      style: style?.copyWith(fontFamily: fontFamily) ??
          TextStyle(fontFamily: fontFamily),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Validate email and password (not implemented)
                // For simplicity, let's just navigate to the dashboard
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
              child: CustomText('Login'),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                // For now, proceed to the dashboard without login (for testing)
                Navigator.pushReplacementNamed(context, '/registration');
              },
              child: CustomText('New User? Register here'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/threshold_fixing');
                  },
                  child: Text('Threshold Fixing'),
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to electricity bill prediction page
                  },
                  child: CustomText('Electricity Bill Prediction'),
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/energyusagebyappliances');
                    // Navigate to energy usage by appliances page
                  },
                  child: CustomText('Energy Usage by Appliances'),
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _showBuildingAutomationOptions(context);
                  },
                  child:
                      CustomText('Integrate with Building Automation System'),
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to IoT devices and sensors page
                  },
                  child: CustomText('IoT Devices and Sensors'),
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/user_feedback');
                  },
                  child: CustomText('User Feedback and Support'),
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to customization and personalization page
                    Navigator.pushNamed(context, '/customization');
                  },
                  child: CustomText('Customization and Personalization'),
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/create_report');
                  },
                  child: Text('Create Report of Appliances'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBuildingAutomationOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Connect with Existing Systems"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("1. KNX"),
              Text("2. BACnet"),
              Text("3. Modbus"),
              Text("4. Custom Protocol"),
              TextField(
                decoration: InputDecoration(
                  labelText: 'IP Address',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Port',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement connection logic
              },
              child: Text("Connect"),
            ),
          ],
        );
      },
    );
  }
}

class EnergyUsageByAppliancesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Energy Used by Appliances'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Appliance List'),
            onTap: () {
              // Navigate to the appliance list page
            },
          ),
          ListTile(
            title: Text('Usage Statistics'),
            onTap: () {
              // Navigate to the usage statistics page
            },
          ),
          ListTile(
            title: Text('Historical Data'),
            onTap: () {
              // Navigate to the historical data page
            },
          ),
          ListTile(
            title: Text('Recommendations'),
            onTap: () {
              // Navigate to the recommendations page
            },
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('About'),
            onTap: () {
              // Navigate to about page
            },
          ),
          ListTile(
            title: Text('Add More Appliances'),
            onTap: () {
              // Navigate to add more appliances page
            },
          ),
          ListTile(
            title: Text('Automation'),
            onTap: () {
              // Navigate to automation page
            },
          ),
          ListTile(
            title: Text('Notifications'),
            onTap: () {
              // Navigate to notifications page
            },
          ),
          ListTile(
            title: Text('Passwords'),
            onTap: () {
              Navigator.pushNamed(context, '/passwords');
            },
          ),
          ListTile(
            title: Text('Reminders'),
            onTap: () {
              // Navigate to reminders page
            },
          ),
        ],
      ),
    );
  }
}

class PasswordsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passwords'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Change Password'),
            onTap: () {
              // Navigate to change password page
            },
          ),
          ListTile(
            title: Text('Forgot Password'),
            onTap: () {
              // Navigate to forgot password page
            },
          ),
          ListTile(
            title: Text('Password Strength Check'),
            onTap: () {
              // Navigate to password strength check page
            },
          ),
          ListTile(
            title: Text('Two-Factor Authentication (2FA)'),
            onTap: () {
              // Toggle 2FA settings
            },
          ),
          ListTile(
            title: Text('Password Lockout Policy'),
            onTap: () {
              // Navigate to password lockout policy settings page
            },
          ),
          ListTile(
            title: Text('Password Recovery Options'),
            onTap: () {
              // Navigate to password recovery options page
            },
          ),
          ListTile(
            title: Text('Password Encryption'),
            onTap: () {
              // Show information about password encryption
            },
          ),
          ListTile(
            title: Text('Password Expiry'),
            onTap: () {
              // Navigate to password expiry settings page
            },
          ),
          ListTile(
            title: Text('Passwordless Authentication'),
            onTap: () {
              // Toggle passwordless authentication settings
            },
          ),
        ],
      ),
    );
  }
}

class ThresholdFixingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Threshold Fixing'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Set Energy Usage Thresholds'),
            onTap: () {
              // Navigate to set energy usage thresholds page
            },
          ),
          ListTile(
            title: Text('Alert Tone'),
            onTap: () {
              // Navigate to alert tone settings page
            },
          ),
          ListTile(
            title: Text('Snooze'),
            onTap: () {
              // Navigate to snooze settings page
            },
          ),
          ListTile(
            title: Text('Set Goal'),
            onTap: () {
              // Navigate to set goal settings page
            },
          ),
        ],
      ),
    );
  }
}

class CreateReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Report of Appliances'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Individual Data'),
            onTap: () {
              // Navigate to individual data report page
            },
          ),
          ListTile(
            title: Text('Visualization Report'),
            onTap: () {
              // Navigate to visualization report page
            },
          ),
        ],
      ),
    );
  }
}

class UserFeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Feedback and Support'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Submit Feedback'),
            onTap: () {
              Navigator.pushNamed(context, '/submit_feedback');
            },
          ),
          ListTile(
            title: Text('FAQs'),
            onTap: () {
              Navigator.pushNamed(context, '/faqs');
            },
          ),
          ListTile(
            title: Text('Contact Support'),
            onTap: () {
              // Navigate to contact support page
            },
          ),
          ListTile(
            title: Text('Help Center'),
            onTap: () {
              // Navigate to help center page
            },
          ),
          ListTile(
            title: Text('Report a Problem'),
            onTap: () {
              Navigator.pushNamed(context, '/report_problem');
            },
          ),
          ListTile(
            title: Text('Live Chat'),
            onTap: () {
              Navigator.pushNamed(context, '/live_chat');
            },
          ),
        ],
      ),
    );
  }
}

class FAQsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildFAQItem(
            question: 'How does the app help in conserving energy?',
            answer:
                'The app helps conserve energy by providing tools for monitoring energy usage, setting usage thresholds, predicting electricity bills, and identifying areas for improvement in energy efficiency.',
          ),
          _buildFAQItem(
            question:
                'What features does the app offer for monitoring energy usage?',
            answer:
                'The app offers features such as real-time monitoring of energy consumption, graphical representations of usage trends, and detailed breakdowns of energy usage by appliances.',
          ),
          _buildFAQItem(
            question:
                'Can I set energy usage thresholds to control consumption?',
            answer:
                'Yes, the app allows users to set energy usage thresholds for different time periods and receive alerts when usage exceeds the specified limits.',
          ),
          _buildFAQItem(
            question:
                'Does the app provide recommendations for reducing energy consumption?',
            answer:
                'Yes, the app provides personalized recommendations based on energy usage patterns to help users reduce consumption and save on electricity bills.',
          ),
          _buildFAQItem(
            question:
                'Is there a way to track my electricity bill using the app?',
            answer:
                'Yes, the app offers features for predicting electricity bills based on current usage patterns and historical data, helping users budget and plan their expenses.',
          ),
          _buildFAQItem(
            question:
                'How accurate are the energy usage predictions provided by the app?',
            answer:
                'The energy usage predictions are based on advanced algorithms and historical data, providing users with accurate estimates of their future electricity bills.',
          ),
          _buildFAQItem(
            question:
                'Can I integrate the app with existing building automation systems?',
            answer:
                'Yes, the app supports integration with existing building automation systems, allowing users to control and monitor energy usage remotely.',
          ),
          _buildFAQItem(
            question:
                'Does the app support the use of IoT devices and sensors for energy monitoring?',
            answer:
                'Yes, the app is compatible with IoT devices and sensors, enabling users to track energy consumption in real-time and receive actionable insights for optimizing usage.',
          ),
          _buildFAQItem(
            question:
                'How can I customize and personalize the app according to my preferences?',
            answer:
                'The app offers customization options such as setting energy usage goals, personalizing alerts and notifications, and adjusting threshold settings based on individual preferences.',
          ),
          _buildFAQItem(
            question:
                'Is there a feature to create reports of energy usage by different appliances?',
            answer:
                'Yes, the app provides tools for generating comprehensive reports of energy usage by different appliances, helping users identify energy-intensive devices and optimize their usage.',
          ),
          _buildFAQItem(
            question:
                'What options are available for user feedback and support within the app?',
            answer:
                'The app includes features for submitting feedback, accessing FAQs, contacting support directly, and participating in live chat sessions with support representatives.',
          ),
          _buildFAQItem(
            question:
                'How can I contact support if I encounter any issues while using the app?',
            answer:
                'Users can contact support through various channels such as email, phone, or live chat within the app to receive assistance with any issues or inquiries.',
          ),
          _buildFAQItem(
            question:
                'Does the app offer reminders or notifications for energy-saving tips and goals?',
            answer:
                'Yes, the app sends regular reminders and notifications with energy-saving tips, progress updates on usage goals, and alerts for potential energy wastage.',
          ),
          _buildFAQItem(
            question:
                'Are there any privacy or security measures in place to protect my data?',
            answer:
                'The app follows strict privacy and security protocols to safeguard user data, including encryption of sensitive information and adherence to industry standards for data protection.',
          ),
          _buildFAQItem(
            question:
                'Can I access my energy usage data from multiple devices using the app?',
            answer:
                'Yes, the app allows users to access their energy usage data from multiple devices by syncing their accounts across platforms, ensuring seamless access to information anytime, anywhere.',
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem({question, answer}) {
    return ExpansionTile(
      title: Text(question),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(answer),
        ),
      ],
    );
  }
}

class SubmitFeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Your Feedback: IT IS IMPORTANT FOR US',
                border: OutlineInputBorder(),
              ),
              maxLines: null, // Allow multiple lines for detailed feedback
            ),
            SizedBox(height: 100.0),
            ElevatedButton(
              onPressed: () {
                // Logic to submit feedback (not implemented)
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class ReportProblemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report a Problem'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Problem Description',
                border: OutlineInputBorder(),
              ),
              maxLines: null, // Allow multiple lines for detailed description
            ),
            SizedBox(height: 100.0),
            ElevatedButton(
              onPressed: () {
                // Logic to submit problem report (not implemented)
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class LiveChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              // Chat history goes here
              itemCount: 0, // Placeholder
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Chat message $index'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Logic to send message (not implemented)
                  },
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _captchaController = TextEditingController();
  String _generatedCaptcha = ''; // Placeholder for the generated captcha

  // Variables to store user input for additional fields
  TextEditingController _contactNumberController = TextEditingController();
  DateTime? _selectedDateOfBirth;
  String? _selectedGender;

  @override
  void initState() {
    super.initState();
    _generatedCaptcha =
        _generateCaptcha(); // Generate captcha when the page is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _contactNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Contact Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Text('Date of Birth: '),
                IconButton(
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    setState(() {
                      _selectedDateOfBirth = selectedDate;
                    });
                  },
                  icon: Icon(Icons.calendar_today),
                ),
                if (_selectedDateOfBirth != null)
                  Text(DateFormat('dd/MM/yyyy').format(_selectedDateOfBirth!)),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Text('Gender: '),
                SizedBox(width: 10.0),
                Radio<String>(
                  value: 'Male',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                Text('Male'),
                SizedBox(width: 20.0),
                Radio<String>(
                  value: 'Female',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                ),
                Text('Female'),
              ],
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _captchaController,
              decoration: InputDecoration(
                labelText: 'Enter Captcha: $_generatedCaptcha',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Check if entered captcha matches the generated captcha
                if (_captchaController.text == _generatedCaptcha) {
                  // Captcha verification passed
                  // Proceed with registration logic
                } else {
                  // Captcha verification failed
                  // Display error message or take appropriate action
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  String _generateCaptcha() {
    // Implement your captcha generation logic here
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return String.fromCharCodes(Iterable.generate(
        6, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
  }

  @override
  void dispose() {
    _captchaController.dispose();
    _contactNumberController.dispose();
    super.dispose();
  }
}

class CustomizationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customization and Personalization'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Home Screen Layout'),
            onTap: () {
              // Navigate to home screen layout settings page
            },
          ),
          ListTile(
            title: Text('Font Settings'),
            onTap: () {
              // Navigate to font settings page
              Navigator.pushNamed(context, '/font_selection');
            },
          ),
          ListTile(
            title: Text('Theme Selection'),
            onTap: () {
              // Navigate to theme selection page
              _showThemeSelectionDialog(context);
            },
          ),
          ListTile(
            title: Text('Notification Preferences'),
            onTap: () {
              // Navigate to notification preferences page
            },
          ),
          ListTile(
            title: Text('Profile Personalization'),
            onTap: () {
              // Navigate to profile personalization page
            },
          ),
          ListTile(
            title: Text('Language Selection'),
            onTap: () {
              Navigator.pushNamed(context, '/language_selection');
            },
          ),
        ],
      ),
    );
  }
}

class LanguageSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Selection'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildLanguageItem(context, 'English', 'en'),
          _buildLanguageItem(context, 'Spanish', 'es'),
          _buildLanguageItem(context, 'Hindi', 'hi'),
          _buildLanguageItem(context, 'Telugu', 'te'),
          _buildLanguageItem(context, 'Tamil', 'ta'),
        ],
      ),
    );
  }

  Widget _buildLanguageItem(
      BuildContext context, String language, String locale) {
    return ListTile(
      title: Text(language),
      onTap: () {
        // Set app language based on selected locale
        _changeLocale(context, locale);
      },
    );
  }

  void _changeLocale(BuildContext context, String localeCode) {
    Locale newLocale = Locale(localeCode);
    MyApp.setLocale(context, newLocale);
    Navigator.pop(context); // Close the language selection page
  }
}

Widget _buildLanguageItem(
    BuildContext context, String language, String locale) {
  return ListTile(
    title: Text(language),
    onTap: () {
      // Set app language based on selected locale
      Navigator.pop(context);
      // Example: changeLocale(Locale('en')); // for English
      // You can use a package like 'flutter_localizations' for better language handling
    },
  );
}

void _showThemeSelectionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Select Theme"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text("Light"),
              onTap: () {
                // Set theme to light mode
                MyApp.of(context)?.setThemeMode(Brightness.light);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Dark"),
              onTap: () {
                // Set theme to dark mode
                MyApp.of(context)?.setThemeMode(Brightness.dark);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}

class FontSelectionPage extends StatefulWidget {
  @override
  _FontSelectionPageState createState() => _FontSelectionPageState();
}

class _FontSelectionPageState extends State<FontSelectionPage> {
  AppFontStyle _selectedFontStyle =
      AppFontStyle.montserrat; // Default font style

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Font Selection'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ...AppFontStyle.values.map((fontStyle) {
            String fontName = fontStyle.toString().split('.').last;
            return ListTile(
              title: Text(fontName),
              onTap: () {
                setState(() {
                  _selectedFontStyle = fontStyle;
                });
                MyApp.setFontStyle(context, fontStyle);
              },
              trailing:
                  _selectedFontStyle == fontStyle ? Icon(Icons.check) : null,
            );
          }).toList(),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              if (_selectedFontStyle != null) {
                MyApp.setFontStyle(context, _selectedFontStyle);
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please select a font style.'),
                  ),
                );
              }
            },
            child: Text('Apply'),
          ),
        ],
      ),
    );
  }
}
