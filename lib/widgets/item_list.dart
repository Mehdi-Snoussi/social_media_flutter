import 'package:flutter/material.dart';

import '../models/post.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key, required this.post,required this.onPressed});
  final Post post;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
          Image.network(
            post.image ??
                "https://images.pexels.com/photos/3782131/pexels-photo-3782131.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      foregroundImage:NetworkImage(
                        post.avatarImage ?? "assets/avatar.jpg",
                      )
                     
                    ),
                     Text(post.name!),
                  ],
                ),
               
                

                Column(
                  children: [
                    Text(post.title ?? "Post 0",
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      post.description ?? "#post#",
                      style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w300,
                          fontSize: 16),
                    ),
                  ],
                ),
                IconButton(
                    onPressed:  onPressed,
                    icon:  Icon(
                     post.isLiked == true 
                     ? Icons.favorite
                     : Icons.favorite_outline,
                      color: Colors.red,
                      size: 30,
                    ))
              ],
            ),
          )
        ]));
  }
}
