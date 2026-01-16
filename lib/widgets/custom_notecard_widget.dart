import 'package:flutter/material.dart';

class CustomNotecardWidget extends StatelessWidget {
  const CustomNotecardWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: double.infinity,

        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: const Text('Flutter tibs'),
                titleTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: const Text('Build your carrier with Amr Khaled'),
                ),
                subtitleTextStyle: TextStyle(
                  color: Colors.black.withAlpha(100),
                  fontSize: 18,
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete, size: 32, color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 2),
                child: Text(
                  'Jan,15,2026',
                  style: TextStyle(color: Colors.black.withAlpha(100)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
