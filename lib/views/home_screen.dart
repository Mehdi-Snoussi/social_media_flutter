
import 'package:first_app/providers/list_provider.dart';
import 'package:first_app/widgets/item_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<ListProvider>(context, listen: false).getList(); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Home Screen",
          style: TextStyle(fontSize: 20),
        )),
      ),
      body: Consumer<ListProvider>(
        builder: (context, value, child) {
          return 
          value.isLoading ? 
          const CupertinoActivityIndicator()
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.red,
                      thickness: 2, // el5ochn mta3 divideer
                    );
                  },
                  itemCount: value.list.length,
                  itemBuilder: (context, index) {
                    return ItemList(
                      post: value.list[index],
                      onPressed: () {
                        Provider.of<ListProvider>(context, listen: false).onPressLike(index); 
                      },
                    );
                  }));
        },
      ),
    );
  }
}
