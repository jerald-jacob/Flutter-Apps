import 'dart:async';

class HMWordsList {
  static const LIMIT = 10;
  List<HMWords> diaryList = new List();
  int lastUpdateDate;

  /// Parse the server response
  HMWordsList(Map responseMap, {int trackableId}) {
    if (null != responseMap && responseMap.isNotEmpty) {
      lastUpdateDate = responseMap["lastUpdateDate"];
      print("Dairy List - Last updated : $lastUpdateDate ");

      dynamic results = responseMap["data"];
      for (dynamic result in results) {
        HMWords diary = new HMWords(result);
        diaryList.add(diary);
      }
    }
  }

  static Future<int> insertAllToDb(List<HMWords> list) async {
    List<Map<String, dynamic>> wordsInsertMaps = List<Map<String, dynamic>>();
    for (HMWords diary in list) {
      var insertMap = diary.getInsertMap();
      if (null != insertMap) {
        wordsInsertMaps.add(insertMap);
      }
    }
    if (wordsInsertMaps.isNotEmpty) {
      int rowsUpdated = await HMWords.insert(wordsInsertMaps);
      print("Diary List Inserted to DB, Rows Updated :::: $rowsUpdated");
      return rowsUpdated;
    }
    return -1;
  }
}

class HMWords {
  static const tableName = "hm_words";
  static const tableSchema = [
    ['name', 'TEXT', ''],
    ['detail', 'TEXT', ''],
  ];

  var name;
  var detail;

  HMWords(Map responseMap) {
    if (null != responseMap && responseMap.isNotEmpty) {
      _fillFromMap(responseMap);
    }
  }

  void _fillFromMap(Map responseMap) {
    this.name = responseMap["name"];
    this.detail = responseMap["detail"];
  }

  /// Will return a map of values represents a db insertion data
  Map<String, dynamic> getInsertMap() {
    Map<String, dynamic> value = new Map<String, dynamic>();
    try {
      value["name"] = name;
      value["detail"] = detail;
    } catch (e) {
      print("Exception Caught [HMWords][getInsertMap] : " + e.toString());
    }
    return value;
  }

  static Future<int> insertAllToDb(List<HMWords> list) async {
    List<Map<String, dynamic>> wordsInsertMaps = List<Map<String, dynamic>>();
    for (HMWords diary in list) {
      var insertMap = diary.getInsertMap();
      if (null != insertMap) {
        wordsInsertMaps.add(insertMap);
      }
    }
    if (wordsInsertMaps.isNotEmpty) {
      int rowsUpdated = await HMWords.insert(wordsInsertMaps);
      print("Words List Inserted to DB, Rows Updated :::: $rowsUpdated");
      return rowsUpdated;
    }
    return -1;
  }

  /// The function can be used to insert a bulk of data in a single transaction
  static Future<int> insert(List<Map<String, dynamic>> dataList) async {
    try {
      if (dataList != null && dataList.length > 0) {
        List<Map<String, dynamic>> targetDataList = new List();
        List<Map<String, dynamic>> diaryDataList = new List();
        List<Map<String, dynamic>> deleteDataList = new List();

        for (Map<String, dynamic> data in dataList) {
          Map<String, dynamic> deleteData = data["targetDeleteMap"];
          if (null != deleteData) {
            deleteDataList.add(deleteData);
            data.remove("targetDeleteMap");
          }

          List<Map<String, dynamic>> targetData = data["targetInsertMaps"];
          if (targetData != null) {
            targetDataList.addAll(targetData);
            data.remove("targetInsertMaps");
          }
          diaryDataList.add(data);
        }

        Map<String, List<Map<String, dynamic>>> insertData =
            Map<String, List<Map<String, dynamic>>>();
        insertData[tableName] = diaryDataList;
        return 0;
      } else {
        return 0;
      }
    } catch (e) {
      print("Exception Caught [HMWords][insert] : " + e.toString());
      return 0;
    }
  }

  HMWords.fillFromDBMap(Map values) {
    name = values["name"];
    detail = values["detail"];
  }

  /// The function will fetch details of diary with the given
  /// diary id and create an [HMWords] object with the fetched data.
  ///
  /// [diaryId] [int] represents a valid diary id.
  ///
  /// Returns: [HMWords] object with fetched data from Db.

}
