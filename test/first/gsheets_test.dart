// ignore_for_file: omit_local_variable_types, unrelated_type_equality_checks
// test('Asset Create Text', () async {
//   final text = 'hello world';
//   final Asset response = await assetsApi.assetsCreateNewAsset(
//     seed: Seed(
//       asset: SeededAsset(
//         application: Application(
//           privacy: PrivacyEnum.OPEN,
//           name: ApplicationNameEnum.VS_CODE,
//           onboarded: true,
//           platform: PlatformEnum.MACOS,
//           version: '1.5.7',
//           id: '6a9e37e1-e49c-4985-ab56-480f67f05a64',
//         ),
//         format: SeededFormat(
//           ///=======
//           fragment: SeededFragment(
//             string: TransferableString(
//               raw: text,
//             ),
//           ),
//         ),
//       ),
//       type: SeedTypeEnum.ASSET,
//     ),
//   );
// });
// print('Images: ${filterImage.length}');
import 'package:core_openapi/api/asset_api.dart' hide Tags;
import 'package:core_openapi/api/assets_api.dart' hide Tags;
import 'package:core_openapi/api/tags_api.dart';
import 'package:core_openapi/api/websites_api.dart';
import 'package:core_openapi/api_client.dart' hide Tags;
import 'package:flutter_test/flutter_test.dart' hide Tags;
import 'package:gsheets/init/src/gsheets.dart';
import 'package:gsheets/languages/list.dart';

const gsheetsCellsLimit = 5000000;

const credentials = r'''

{
  "type": "service_account",
  "project_id": "flutter-gsheets-355919",
  "private_key_id": "336d7cfee18940b61b06e04a92bd48fbc496cb1f",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDGV8tCv18Ga7Ia\nQxiAI4qtN51UY+AuccMebOFRzOhMT//wTMgDFmuxS90joiRRQjcmTIzuMtBB+/Yy\nUqhklUACg5hxqgMzwMBuzilmGiApQgWuAYWNTw/SbR1ZsUs3UeyzJ88nz6jpyVdH\nQ2FjWyp8gb/HyYirH+09u7LekkWeFETvdQHwlV+PPRrFM9Nt/TH8aoy0PJMcJu4Y\n0KxHW++azYMu6g6JtGMeB7g2Q+k29LlFWkdEqo8eBlWcKruub7or52NVeHu1OIsx\nkTQwuga3TiuSzil/Aqr0bFFqC2aFI2fCv6coC7boszr0y5lT6MPy4ZVE8qG430rN\noBu5p4FJAgMBAAECggEACx2VdxlUK9RyR/WAVIIUE1loDaLb8qO5LHsr9NJ30aW0\nHBVO1O7Mke7vUZVp1Uym3D8dsNBpNSF37oxiV+IOEyCpNPQzDL3zKuKOlbnGGU8p\naVM4LFoEyCVe/Tf/P/ZCk9cZzXXeVgfMxozN/Zb43mnDw+BqsohuBRp/+j2WqDa0\n98rrteWPYMNOoQ6fF8qd9UBOSwr5by7otMzjvzW/L4jRM+ZG6gQeuUCGRU6EDu+H\nrNaFFU9+fMGuK2DGWjtXH6OkOZ/txVIWUhoXTUmA/ATZXi1iN6QE/tjo86AcpVez\nNHOvGGwRns5wRHbqjuFtie3AciyuHy11SaOQPPEPzwKBgQDs5GNEducEVGLO+9FI\nlQ9CeQHznQbmmOowKvLg2Svkdnoe3Q58jPuAqzsNQLjt+BATcrXw9H7j/hh/BPH+\n53QXLbBVtyMTndOFN5VXrY3MgWw1FWRObedfqu2FAjiHq2yDOt8AydyLr8AX58o5\n0kH3Sx5OsHlxdLlL0mgRJOCuUwKBgQDWV2ZMfb1ekIx7gaUqgOTkVeMYJ4kwV00+\n2Ye+2qSOUp5cqSjYxXVlt0Nszyz/xJu4oMfSCFaeSzyMImgeNQb/FL6tb5OoJwR9\nQapyHFqqBVX/5c7ZIAeDRCh84suFeUhDKZds/ClhdWBaaWeHpSdPdYvWWt5N0VVx\nCkjh9+fGcwKBgHYWHzm4v84TtrGRK7EvxMyQ/50NsKvwnATo0+urtkqLmLKb5SXH\nLXPlZ2li0wyk9HaNXw6/AiXquxFOSMeVXvRS7Sy9Pvn/Wbp1i7eKJz5DYcpQYJEM\nDiNNVFtSURWoKU59YT7GYW8sa+g+vjr2ibWZN4FoTRF2awvV1dR9+pZLAoGAVwGV\nYhlshHVywTPIQu+del6u14A8/SWDEq8knkGMqMU6yWxVS2EkHYz9zq5umshJWfHS\nCx0dZBYwVsYks5Zc57CZEjgHnStxdBLyyG1gFEIkPcMgaxzIT+2b7c32RZEM106L\nzE6z0X7fBPRidTqCMYwKnpG2Sape34sIOMn0CKcCgYApU9qSoeZZQYP9xAre4pst\nPoceesDw7IDg9so/i8+GlD1j0GRKexptrY2CVwgGu+6jufJoo9t7qjypV3bMZB5K\nLlWRyBzcIoDt1mPALml67hxG4qnSF3qJDdU187lQzks+CCFJHIbISxxbzqG3M8n/\n1E9ho/2obvQmcz35A9Wm7g==\n-----END PRIVATE KEY-----\n",
  "client_email": "flutter-gsheets@flutter-gsheets-355919.iam.gserviceaccount.com",
  "client_id": "101366955861814063269",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-gsheets%40flutter-gsheets-355919.iam.gserviceaccount.com"
}

''';

void main() async {
  ApiClient api = ApiClient(basePath: 'http://localhost:1000');

  /// g sheets api's
  final gsheets = GSheets(credentials);
  final spreadsheetID = '18IlCBkFo9Y1Q0BshWiHehI0p3zufEImkWqOr23kBMcM';
  final ssheet = await gsheets.spreadsheet(spreadsheetID);

  /// pieces api's
  AssetsApi assetsApi = AssetsApi(ApiClient(basePath: 'http://localhost:1000'));
  AssetApi assetApi = AssetApi(ApiClient(basePath: 'http://localhost:1000'));
  Assets assetsSnapshot = await assetsApi.assetsSnapshot();
  List<Asset> assetCount = assetsSnapshot.iterable;

  TagsApi tagsApi = TagsApi(ApiClient(basePath: 'http://localhost:1000'));
  Tags tagsSnapshot = await tagsApi.tagsSnapshot(transferables: false);
  List<Tag> tags = tagsSnapshot.iterable;
  List<Tag> filterTags = tags.where((element) => element.text.isNotEmpty).toList();

  /// ==========================================================================================

  /// related links count
  WebsitesApi websitesApi = WebsitesApi(ApiClient(basePath: 'http://localhost:1000'));
  Websites websitesSnapshot = await websitesApi.websitesSnapshot(transferables: false);
  List<Website> link = websitesSnapshot.iterable;
  List<dynamic> totals = [
    '${assetCount.length}',
    '${filterTags.length}',
    '${link.length}',
  ];

  ///batchfile
  List<Asset> filterBatchfile = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.bat)
      .toList();

  /// c
  List<Asset> filterC = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.c)
      .toList();

  ///c#
  List<Asset> filterCSharp = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.cs)
      .toList();

  /// coffeescript
  List<Asset> filterCoffeeScript = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.coffee)
      .toList();

  ///c++
  List<Asset> filterPlusPlus = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.cpp)
      .toList();

  /// css
  List<Asset> filterCss = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.css)
      .toList();

  /// dart
  List<Asset> filterDart = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.dart)
      .toList();

  /// erlang
  List<Asset> filterErlang = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.erl)
      .toList();

  /// go
  List<Asset> filterGo = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.go)
      .toList();

  /// haskell
  List<Asset> filterHaskell = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.hs)
      .toList();

  /// html
  List<Asset> filterHtml = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.html)
      .toList();

  /// image
  List<Asset> filterImage = assetCount
      .where((element) =>
          element.original.reference?.classification.generic == ClassificationGenericEnum.IMAGE)
      .toList();

  /// java
  List<Asset> filterJava = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.java)
      .toList();

  /// javascript
  List<Asset> filterJavaScript = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.js)
      .toList();

  /// json
  List<Asset> filterJson = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.json)
      .toList();

  /// Lua
  List<Asset> filterLua = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.lua)
      .toList();

  /// markdown
  List<Asset> filterMarkDown = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.md)
      .toList();

  /// matLab
  List<Asset> filterMatLab = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.matlab)
      .toList();

  /// objective c =================
  List<Asset> filterObjectiveC = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.m)
      .toList();

  /// php
  List<Asset> filterPhp = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.php)
      .toList();

  /// perl
  List<Asset> filterPerl = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.pl)
      .toList();

  /// powershell
  List<Asset> filterPowershell = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.ps1)
      .toList();

  /// python
  List<Asset> filterPython = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.py)
      .toList();

  /// R
  List<Asset> filterR = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.r)
      .toList();

  /// ruby
  List<Asset> filterRuby = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.rb)
      .toList();

  /// rust
  List<Asset> filterRust = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.rs)
      .toList();

  /// scala
  List<Asset> filterScala = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.scala)
      .toList();

  /// SHELL
  List<Asset> filterShell = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.sh)
      .toList();

  /// SQL
  List<Asset> filterSql = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.sql)
      .toList();

  /// SWIFT
  List<Asset> filterSwift = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.swift)
      .toList();

  /// TYPE SCRIPT
  List<Asset> filterTypescript = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.ts)
      .toList();

  /// TEX
  List<Asset> filterTex = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.tex)
      .toList();

  print('filterTex: ${filterTex.length}');

  /// TEXT
  List<Asset> filterText = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.text)
      .toList();

  /// TOML
  List<Asset> filterToml = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.toml)
      .toList();

  /// YAML
  List<Asset> filterYaml = assetCount
      .where((element) =>
          element.original.reference?.classification.specific == ClassificationSpecificEnum.yaml)
      .toList();

  group('Testing the connectorApi ', () {
    test('[format/{format} [GET] scoped to format', () async {
      ///  .--.      .--.      .--.      .--.      .--.      .--.      .--.      .--.
      /// :::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
      /// '      `--'      `--'      `--'      `--'      `--'      `--'      `--'      `
      Worksheet? ws = await ssheet.worksheetByTitle('tests');

      Assets assetsSnapshot = await assetsApi.assetsSnapshot();

      /// (3) creat local var

      /// (4) && (5) iterate over our snapshot.
      /// option 1 normal for loop
      List<String> websiteUrls = [];
      for (Asset asset in assetsSnapshot.iterable) {
        // if (asset.original.reference?.websites.toString() == FlattenedWebsites) {
        //   /// add to our list!
        //   websites.iterable.add(asset);
        // }
        websiteUrls = [
          ...websiteUrls,
          ...(asset.websites?.iterable.map((e) => e.url).toList() ?? [])
        ];
      }

      /// this last step here will just filter out an empty strings.
      websiteUrls = websiteUrls.map((e) => e).toList();
      final uniqueList = websiteUrls.toSet();

      await ws?.values.insertColumn(1, ['${uniqueList.toList()}'], fromRow: 24);
      print(uniqueList);

      /// (6) print our new codeAssets
      // print('here are our url assets $websiteUrls');
    });
    // test('[format/{format} [GET] scoped to Tags', () async {
    //   ///  .--.      .--.      .--.      .--.      .--.      .--.      .--.      .--.
    //   /// :::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
    //   /// '      `--'      `--'      `--'      `--'      `--'      `--'      `--'      `
    //   Worksheet? ws = await ssheet.worksheetByTitle('tests');
    //
    //   var tag1 = filterTags.toString();
    //   print('${tag1.toString()}');
    //
    //   await ws?.values.insertColumn(1, ['$tag1'], fromRow: 22);
    // });

    test('inserts', () async {
      ///  .--.      .--.      .--.      .--.      .--.      .--.      .--.      .--.
      /// :::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\::::::::.\
      /// '      `--'      `--'      `--'      `--'      `--'      `--'      `--'      `
      Worksheet? ws = await ssheet.worksheetByTitle('tests');

      /// 1st row headers
      await ws?.values.insertRow(14, headers, fromColumn: 7);

      /// 2nd row totals
      await ws?.values.insertRow(15, totals, fromColumn: 7);

      /// Languages Column
      await ws?.values.insertColumn(1, languages1, fromRow: 3);

      ///  Count Column
      await ws?.values.insertColumn(
          2,
          [
            '#',
            '${filterBatchfile.length}',
            '${filterC.length}',
            '${filterCSharp.length}',
            '${filterCoffeeScript.length}',
            '${filterPlusPlus.length}',
            '${filterCss.length}',
            '${filterDart.length}',
            '${filterErlang.length}',
            '${filterGo.length}',
            '${filterHaskell.length}',
            '${filterHtml.length}',
            '${filterJava.length}',
            '${filterJavaScript.length}',
            '${filterJson.length}',
            '${filterLua.length}',
            '${filterMarkDown.length}',
            '${filterMatLab.length}',
          ],
          fromRow: 2);

      await ws?.values.insertColumn(4, languages2, fromRow: 3);

      ///  Count Column
      await ws?.values.insertColumn(
          5,
          [
            '#',
            '${filterObjectiveC.length}',
            '${filterPhp.length}',
            '${filterPerl.length}',
            '${filterPowershell.length}',
            '${filterPython.length}',
            '${filterR.length}',
            '${filterRuby.length}',
            '${filterRust.length}',
            '${filterScala.length}',
            '${filterShell.length}',
            '${filterSql.length}',
            '${filterSwift.length}',
            '${filterTypescript.length}',
            '${filterTex.length}',
            '${filterText.length}',
            '${filterToml.length}',
            '${filterYaml.length}',
            '${filterImage.length}',
          ],
          fromRow: 2);
    });
  });
}
// Batchfile
// C
// C#
// C++
// CoffeeScript
