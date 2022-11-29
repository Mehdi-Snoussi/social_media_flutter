import 'package:first_app/models/post.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ListProvider extends ChangeNotifier {
  List<Post> list = [];
  bool isLoading = false;

  Future getList() async {
    isLoading = true;

    var url = Uri.parse(
        "https://api-app-a161b-default-rtdb.firebaseio.com/posts.json");

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;

      List<Post> post = [];
      jsonResponse.forEach((key, value) {
        Post element = Post.formJson(value);
        post.add(element);
      });

      isLoading = false;
      list = post;
      if (kDebugMode) {
        print('Number of books about http: $post.');
      }
    } else {
      if (kDebugMode) {
        isLoading = false;
        print('Request failed with status: ${response.statusCode}.');
      }
    }
    notifyListeners();
  }

  onPressLike(int index) {
    list[index].isLiked = !list[index].isLiked!;
    notifyListeners();
  }
  
}
