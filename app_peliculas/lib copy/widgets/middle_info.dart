import 'package:flutter/material.dart';

class MiddleInfo extends StatelessWidget {
  const MiddleInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Hola Mundo', style: TextStyle(fontWeight: FontWeight.bold),),
              Text('Hola Mundo', style: TextStyle(color: Colors.black45),)
            ],
          ),
          Expanded(child: Container()),
          const Icon(Icons.star, color: Colors.red,),
          const SizedBox(width: 5,),
          const Text('41')
        ],
      ),
    );
  }
}