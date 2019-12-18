import 'dart:async';
import 'package:hangman/api/rest_data_source.dart';
import 'package:hangman/dao/hm_words.dart';



 abstract class GetWordsListPresenterContract {


   void onWordsSyncComplete(HMWordsList data);

   void onGroupListSuccess(data);
 }
class GetWordsListPresenter {
  GetWordsListPresenterContract _view;
  RestDataSource api = new RestDataSource();


  GetWordsListPresenter(this._view);

  Future<HMWordsList> doSyncWordList() {
    Future<HMWordsList> response = api.getWordsList();
    response.then((HMWordsList data) async {
      print("Fetch words-list success");

      _view.onWordsSyncComplete(data);
    }).catchError((Object error) {
      print("Fetch teacher-words-list failed ::: " + error.toString());
//      if (error is EduPlusError) {
//        _view.onWordsSyncError(error);
//      } else {
//        _view.onWordsSyncError(EduPlusError.internalError);
//      }
    });
    return response;
  }



}