import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttercrypto/data/crypto_data.dart';

class ProdCryptoRepository implements CryptoRepository {
  // https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest
  String cryptoUrl =
      "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=19b219c9-7256-4194-9429-4f315d070b61&&limit=5";

  @override
  Future<List<Crypto>> fetchCurrencies() async {
    http.Response response = await http.get(Uri.parse(cryptoUrl));

    //Map<String, dynamic> responseBody = json.decode(response.body);
    final List responseBody = json.decode(response.body)['data'];
    final statusCode = response.statusCode;
    // ignore: unnecessary_null_comparison
    if (statusCode != 200 || responseBody == null) {
      throw new FetchDataException(
          "An error ocurred : [Status Code : $statusCode]");
    }
    
    //List<Crypto> ret = responseBody.map((c) => new Crypto.fromMap(c)).toList();
    return responseBody.map((c) => new Crypto.fromMap(c)).toList();
  }
}
