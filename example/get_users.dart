/// Returns string of user's name. If any error, put error message inside the list
class GetUsers {
  static const GQL_NAME = 'Users';

  final GqlParser _parser;

  const GetUsers({
    required GqlParser parser,
  })  : _parser = parser;

  Future<(List<String>, String[])> call() async {

    try {
      final response = await http.post(
        Uri.parse(_flavor.graphQLEndpoint + '/graphql/query'),
        headers: Map.from(
          {
            'Content-Type': 'application/json; charset=utf-8',
            'X-Apollo-Operation-Name': 'post',
            'Apollo-Require-Preflight': 'true',
            /// TODO: Add authorization token here: 
            /// 'Authorization': 'Bearer ${_buildToken()}'
          },
        ),
        body: await _parser.gqlRequestBody(
          'subdirectory/$GQL_NAME.q.gql',
          {
            'fetchOptions': {
              // TODO: Add fetch options
            },
          },
        ),
      );

      final a = json.decode(response.body);

      final users =
          ((a['data']?['users'] ?? []) as List<dynamic>)
              .map((e) {
                // TODO: Return parsed data.
              }).toList();
  
      final errors = ((a?['errors'] ?? []) as List<dynamic>)
          .map((e) {
            // TODO: Return parsed error messages
          });

      return (errors, users);
    } catch (e) {
      // TODO: Catch error and return default error messages
    }
  }
}
