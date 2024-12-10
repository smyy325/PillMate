import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:pill_mate/gemini/model.dart';
import 'package:intl/intl.dart';

class GeminiChat extends StatefulWidget {
  const GeminiChat({super.key});

  @override
  State<GeminiChat> createState() => _GeminiChatState();
}

class _GeminiChatState extends State<GeminiChat> {

  static const apiKey = "AIzaSyALEA8s9H0VW3OJm4TzxB4mpXsAyLlH1Fo";
  
  final model = GenerativeModel(model: "gemini-pro", apiKey: apiKey);

  final List<ModelMessage> prompt =[];

  Future<void> sendMessage() async {
    final message = promprController.text;
    setState(() {
      promprController.clear();
      prompt.add(
        ModelMessage(isPrompt: true, message: message, time: DateTime.now()),
      );
    });
    final content = [Content.text(message)];
    final response = await model.generateContent(content);
    setState(() {
      prompt.add(
        ModelMessage(isPrompt: false, message: response.text ?? "", time: DateTime.now()),
      );
    });
  }

  TextEditingController promprController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.green[200],
      appBar: AppBar(
        //backgroundColor: Colors.green[200],
        elevation: 3,
        title:const Text("Gemini"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: prompt.length,
              itemBuilder: (context,index){
              final message = prompt[index];
            return UserPrompt(isPrompt: message.isPrompt, message: message.message, date: DateFormat('hh:mm a').format(message.time));
          })),
          Padding(padding: EdgeInsets.all(25),
          child: Row(
            children: [
            Expanded(
              flex: 20,
                child: TextField(
                  controller: promprController,
              style:const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Enter a prompt here",
                  ),
            ),
            ),
              const Spacer(),
              GestureDetector(
                onTap:(){
                  sendMessage();
                },
                child: CircleAvatar(
                  radius: 29,
                  backgroundColor: Colors.green[400],
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              )
          ],),
          ),

        ],
      ),
    );
  }
  Container UserPrompt({required final bool isPrompt, required String message, required String date}){
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 15).copyWith(left:isPrompt ?80:15, right: isPrompt ? 15:80),
        decoration: BoxDecoration(color: isPrompt ?Colors.green[300]:Colors.grey[200],
        borderRadius: BorderRadius.only(topLeft:const Radius.circular(20), topRight:const Radius.circular(20),
          bottomLeft: isPrompt ? Radius.circular(20):Radius.zero,
          bottomRight: isPrompt ? Radius.zero:Radius.circular(20),
        ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
          message,
          style: TextStyle(
            fontWeight: isPrompt ? FontWeight.bold : FontWeight.normal,
            fontSize: 18,
            color: isPrompt ? Colors.white : Colors.black,
          ),
        ),
            Text(
              date,
              style: TextStyle(
                fontSize: 18,
                color: isPrompt ? Colors.white : Colors.black,
              ),
            )
        ],
    ),
    );
  }
}
