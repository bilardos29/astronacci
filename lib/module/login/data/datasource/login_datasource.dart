import 'package:astronacci/utils/api_client/api_client.dart';
import 'package:astronacci/utils/api_client/dio/exception.dart';
import 'package:astronacci/utils/api_client/dio/raw_api_response.dart';
import 'package:astronacci/utils/config/api_endpoint.dart';

abstract class LoginDatasourceInterface{

  void login(String username, String password);
}

class LoginDatasourceImpl extends LoginDatasourceInterface {

  LoginDatasourceImpl({
    required this.apiClient,
    required this.apiEndpoint,
  });

  final ApiClient apiClient;
  final ApiEndpoint apiEndpoint;

  @override
  void login(String username, String password) async {
    // TODO: implement login
    try {
      final response = await apiClient.get(
        apiEndpoint.login,
        queryParams: {'username': username, 'password': password},
      );

      final rawData = RawApiResponse.fromJson(response).data;
      final rawResult = RawResultResponse.fromJson(rawData).result;
      // final List<ConversationCustomModel> listConversation =
      // List.from(rawResult)
      //     .map((json) => ConversationCustomModel.fromJson(json))
      //     .toList();
      // return listConversation;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw DataException(
        message: 'Data tidak sesuai',
        detail: e.toString(),
      );
    }
  }

}