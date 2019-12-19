import 'package:flutter/material.dart';
import 'package:hangman/api/rest_data_source.dart';
import 'package:hangman/dao/hm_words.dart';

import 'get_words_list_presenter.dart';

class GetWordsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GetWordsListPresenterState();
  }
}

class GetWordsListPresenterState extends State<GetWordsList>
    implements GetWordsListPresenterContract {
  GetWordsListPresenter _presenter;
  List<HMWords> _wordsList = new List();

  GetWordsListPresenterState() {
    _presenter = new GetWordsListPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[Text("hai")],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _wordsAPICall(true);
  }

  void _wordsAPICall(bool clear) async {
    //   _presenter = new GetWordsListPresenter(this);
    _presenter.doSyncWordList();
  }

  @override
  RestDataSource api;

  @override
  void onGroupListSuccess(data) {}

  @override
  void onWordsSyncComplete(HMWordsList data) {
    _wordsList.addAll(data.diaryList);
    print("data fetch success");
  }
}

abstract class ItemClickCallback {
  void onListItemClick(HMWords words);

  void onItemLongPress(HMWords words);
}
