
// useless for this app
class HonorBoardHelper {
  // // Get DC Honor board
  // static Future<List<HonorBoardResModel>> getDCHonor() async {
  //   http.Response? response;
  //   Map<String, String> requestHeaders = {
  //     "Content-Type": "application/json",
  //   };
  //
  //   try {
  //     response = await http.get(
  //       Uri.parse('${Config.apiUrl}${Config.honorBoardUrl}'),
  //       headers: requestHeaders,
  //     );
  //   } catch (e) {
  //     debugPrint('Honor Board Api Call error: $e');
  //   }
  //
  //   if (response?.statusCode == 200) {
  //     List<HonorBoardResModel> dcHonorBoardList;
  //
  //     try {
  //       // Decode response body as UTF-8 for Bengali support
  //       final decodedResponse =
  //       jsonDecode(utf8.decode(response!.bodyBytes)) as List;
  //
  //       // Map the decoded response to the model
  //       dcHonorBoardList = decodedResponse
  //           .map((data) => HonorBoardResModel.fromJson(data))
  //           .toList();
  //
  //       return dcHonorBoardList;
  //     } catch (e) {
  //       debugPrint('Error parsing response data: $e');
  //       throw Exception('Failed to parse Honor Board data');
  //     }
  //   } else {
  //     throw Exception('Failed to get Honor Board data');
  //   }
  // }
}
