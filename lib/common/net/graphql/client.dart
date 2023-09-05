import 'package:flutter_app_study/common/utils/common_utils.dart';
import 'package:graphql/client.dart';




GraphQLClient? _innerClient;

initClient(token) async {
  _innerClient ??= await _client(token);
}


Future<GraphQLClient> _client(token) async{
  final HttpLink _httpLink = HttpLink(
    'https://api.github.com/graphql',
  );

  final AuthLink _authLink = AuthLink(
    getToken: ()=>"$token",
  );
  final Link _link = _authLink.concat(_httpLink);

  //本地缓存
  var path = await CommonUtils.getApplicationDocumentsPath();
  final store = await HiveStore.open(path: path);
  return GraphQLClient(link: _link, cache: GraphQLCache(store: store));
}


releaseClient() {
  _innerClient = null;
}