import 'package:flutter/material.dart';
import 'package:pemrogramanmobile_11/data.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Add your authentication logic here
    // For simplicity, let's just print the entered credentials for now
    print('Username: ${_usernameController.text}');
    print('Password: ${_passwordController.text}');

    // Navigate to the home page after successful login
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List<Map> staticData = MyData.data;



 @override
 Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 10,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
              context,
             MaterialPageRoute(builder: (context) => LoginPage()),);
              // Navigate back to the previous screen
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                // Refresh the content
              },
            ),
          ],
          title: Text('Data Produk'),

          bottom: AppBar(
            title: Text('Filter Produk',
            style: TextStyle(fontSize: 15),),
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                // Refresh the content
              },
              )
            ],
          ),
        ),
        body:  ListView.separated(
          itemBuilder: (builder, index) {
            Map data = staticData[index];
            return 
            ListTile(
            title: Text("${data['barang']}",   
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
             ),
            ),
            subtitle: Text("Rp. ${data['harga']}"),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${data['id']}')
              ],
            ),
            trailing: Icon(Icons.delete,
            color: Colors.red),
            );
          }, itemCount: staticData.length,
            separatorBuilder: (context, index) {
           return Divider();
           },
          ),
          floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('Floating button pressed');
          },
          child: Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 239, 115, 106),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))
        ),
        ),
        ),
      );
 }
}


