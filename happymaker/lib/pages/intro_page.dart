 import 'package:flutter/material.dart';


 class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 152, 222, 154),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            

            const SizedBox(height: 25,),
            
            // icon
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset('lib/images/logo.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset('lib/images/logo_name.png'),
            ),

            const SizedBox(height: 5.0,),
        
            // title
            const Text(
              'Improve Work Life With AI', style: TextStyle(fontSize: 44, color: Colors.white), 
            ),

            

            // subtitle
            const Text(
              'Let the power of AI influence you into making happier life choices', style: TextStyle(fontSize: 15, color: Colors.grey), 
            ),
        
            // get started button
            //const MyButton(text: "Get Started", onTap: ,),
        
        
          ],
        ),
      ),
    );
  }
 }