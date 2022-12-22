import 'package:first_app/widgets/profile_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/list_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            const CircleAvatar(
              foregroundImage: NetworkImage(
                  "https://images.pexels.com/photos/14339163/pexels-photo-14339163.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
              radius: 30,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Ahmed Ahmed"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                ProfileItem(title: "posts", value: 5),
                ProfileItem(title: "Likes", value: 0),
                ProfileItem(title: "Followers", value: 500),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Consumer<ListProvider>(
                builder: (context, value, child) {
                  return value.isLoading
                      ? const CupertinoActivityIndicator()
                      : GridView.builder(
                          itemCount: value.list.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  mainAxisExtent: 150),
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Image.network(
                                    value.list[index].image!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                      onPressed: () {
                                        Provider.of<ListProvider>(context, listen: false).onPressLike(index);
                                      },
                                      icon: Icon(
                                          color : Colors.red,
                                          value.list[index].isLiked!
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined)),
                                )
                              ],
                            );
                          });
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
