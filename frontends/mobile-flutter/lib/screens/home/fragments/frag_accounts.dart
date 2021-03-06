import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:$name$/data/db_helper.dart';
import 'package:$name$/data/api_client.dart';
import 'package:$name$/models/$param.service_name_snake_case$.dart';
import 'package:$name$/Components/ListViewContainer.dart';
import 'package:toast/toast.dart';

// ignore: must_be_immutable
class $param.service_name_camel_case$sFragment extends StatelessWidget implements ClickHandler {

  BuildContext context;
  final ApiClient api = new ApiClient();
  final JsonDecoder _decoder = new JsonDecoder();
  DecorationImage avatar6 = new DecorationImage(
    image: new ExactAssetImage('assets/avatars/avatar-6.jpg'),
    fit: BoxFit.cover,
  );

  $param.service_name_camel_case$sFragment(BuildContext context) {
    this.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: api.privateApi('').get("/$param.service_name_snake_case$s?page=0&limit=20"),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(child: new Text("Failed fetching data"));
          } else if (snapshot.hasData) {
            var encoded = _decoder.convert(snapshot.data);
            final parsed = encoded["entries"].cast<Map<String, dynamic>>();
            List<$param.service_name_camel_case$> $param.service_name_snake_case$s = parsed.map<$param.service_name_camel_case$>((json) => $param.service_name_camel_case$.fromJson(json)).toList();

            return new ListViewContent(listObjects: $param.service_name_snake_case$s, listener: this);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }

      },
    );
  }

  @override
  void onItemClick(dataID) async {
    // @TODO(*): code here
  }

}