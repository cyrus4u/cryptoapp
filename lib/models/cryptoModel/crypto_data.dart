
class CryptoCurrencyList {
  int? id;
  String? name;
  String? symbol;
  String? slug;
  int? cmcRank;
  int? marketPairCount;
  int? circulatingSupply;
  int? selfReportedCirculatingSupply;
  int? totalSupply;
  int? maxSupply;
  double? ath;
  double? atl;
  double? high24H;
  double? low24H;
  int? isActive;
  String? lastUpdated;
  String? dateAdded;
  List<Quotes>? quotes;
  bool? isAudited;
  List<dynamic>? auditInfoList;
  List<int>? badges;

  CryptoCurrencyList({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.cmcRank,
    this.marketPairCount,
    this.circulatingSupply,
    this.selfReportedCirculatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.atl,
    this.high24H,
    this.low24H,
    this.isActive,
    this.lastUpdated,
    this.dateAdded,
    this.quotes,
    this.isAudited,
    this.auditInfoList,
    this.badges,
  });

  CryptoCurrencyList.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["symbol"] is String) {
      symbol = json["symbol"];
    }
    if (json["slug"] is String) {
      slug = json["slug"];
    }
    if (json["cmcRank"] is int) {
      cmcRank = json["cmcRank"];
    }
    if (json["marketPairCount"] is int) {
      marketPairCount = json["marketPairCount"];
    }
    if (json["circulatingSupply"] is int) {
      circulatingSupply = json["circulatingSupply"];
    }
    if (json["selfReportedCirculatingSupply"] is int) {
      selfReportedCirculatingSupply = json["selfReportedCirculatingSupply"];
    }
    if (json["totalSupply"] is int) {
      totalSupply = json["totalSupply"];
    }
    if (json["maxSupply"] is int) {
      maxSupply = json["maxSupply"];
    }
    if (json["ath"] is double) {
      ath = json["ath"];
    }
    if (json["atl"] is double) {
      atl = json["atl"];
    }
    if (json["high24h"] is double) {
      high24H = json["high24h"];
    }
    if (json["low24h"] is double) {
      low24H = json["low24h"];
    }
    if (json["isActive"] is int) {
      isActive = json["isActive"];
    }
    if (json["lastUpdated"] is String) {
      lastUpdated = json["lastUpdated"];
    }
    if (json["dateAdded"] is String) {
      dateAdded = json["dateAdded"];
    }
    if (json["quotes"] is List) {
      quotes = json["quotes"] == null
          ? null
          : (json["quotes"] as List).map((e) => Quotes.fromJson(e)).toList();
    }
    if (json["isAudited"] is bool) {
      isAudited = json["isAudited"];
    }
    if (json["auditInfoList"] is List) {
      auditInfoList = json["auditInfoList"] ?? [];
    }
    if (json["badges"] is List) {
      badges = json["badges"] == null ? null : List<int>.from(json["badges"]);
    }
  }

  static List<CryptoCurrencyList> fromList(List<Map<String, dynamic>> list) {
    return list.map(CryptoCurrencyList.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["symbol"] = symbol;
    _data["slug"] = slug;
    _data["cmcRank"] = cmcRank;
    _data["marketPairCount"] = marketPairCount;
    _data["circulatingSupply"] = circulatingSupply;
    _data["selfReportedCirculatingSupply"] = selfReportedCirculatingSupply;
    _data["totalSupply"] = totalSupply;
    _data["maxSupply"] = maxSupply;
    _data["ath"] = ath;
    _data["atl"] = atl;
    _data["high24h"] = high24H;
    _data["low24h"] = low24H;
    _data["isActive"] = isActive;
    _data["lastUpdated"] = lastUpdated;
    _data["dateAdded"] = dateAdded;
    if (quotes != null) {
      _data["quotes"] = quotes?.map((e) => e.toJson()).toList();
    }
    _data["isAudited"] = isAudited;
    if (auditInfoList != null) {
      _data["auditInfoList"] = auditInfoList;
    }
    if (badges != null) {
      _data["badges"] = badges;
    }
    return _data;
  }
}

class Quotes {
  String? name;
  double? price;
  double? volume24H;
  double? volume7D;
  double? volumePercentChange;
  double? volume30D;
  double? marketCap;
  int? selfReportedMarketCap;
  double? percentChange1H;
  double? percentChange24H;
  double? percentChange7D;
  String? lastUpdated;
  double? percentChange30D;
  double? percentChange60D;
  double? percentChange90D;
  double? fullyDilluttedMarketCap;
  double? marketCapByTotalSupply;
  double? dominance;
  double? turnover;
  double? ytdPriceChangePercentage;
  double? percentChange1Y;

  Quotes({
    this.name,
    this.price,
    this.volume24H,
    this.volume7D,
    this.volumePercentChange,
    this.volume30D,
    this.marketCap,
    this.selfReportedMarketCap,
    this.percentChange1H,
    this.percentChange24H,
    this.percentChange7D,
    this.lastUpdated,
    this.percentChange30D,
    this.percentChange60D,
    this.percentChange90D,
    this.fullyDilluttedMarketCap,
    this.marketCapByTotalSupply,
    this.dominance,
    this.turnover,
    this.ytdPriceChangePercentage,
    this.percentChange1Y,
  });

  Quotes.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["price"] is double) {
      price = json["price"];
    }
    if (json["volume24h"] is double) {
      volume24H = json["volume24h"];
    }
    if (json["volume7d"] is double) {
      volume7D = json["volume7d"];
    }
    if (json["volumePercentChange"] is double) {
      volumePercentChange = json["volumePercentChange"];
    }
    if (json["volume30d"] is double) {
      volume30D = json["volume30d"];
    }
    if (json["marketCap"] is double) {
      marketCap = json["marketCap"];
    }
    if (json["selfReportedMarketCap"] is int) {
      selfReportedMarketCap = json["selfReportedMarketCap"];
    }
    if (json["percentChange1h"] is double) {
      percentChange1H = json["percentChange1h"];
    }
    if (json["percentChange24h"] is double) {
      percentChange24H = json["percentChange24h"];
    }
    if (json["percentChange7d"] is double) {
      percentChange7D = json["percentChange7d"];
    }
    if (json["lastUpdated"] is String) {
      lastUpdated = json["lastUpdated"];
    }
    if (json["percentChange30d"] is double) {
      percentChange30D = json["percentChange30d"];
    }
    if (json["percentChange60d"] is double) {
      percentChange60D = json["percentChange60d"];
    }
    if (json["percentChange90d"] is double) {
      percentChange90D = json["percentChange90d"];
    }
    if (json["fullyDilluttedMarketCap"] is double) {
      fullyDilluttedMarketCap = json["fullyDilluttedMarketCap"];
    }
    if (json["marketCapByTotalSupply"] is double) {
      marketCapByTotalSupply = json["marketCapByTotalSupply"];
    }
    if (json["dominance"] is double) {
      dominance = json["dominance"];
    }
    if (json["turnover"] is double) {
      turnover = json["turnover"];
    }
    if (json["ytdPriceChangePercentage"] is double) {
      ytdPriceChangePercentage = json["ytdPriceChangePercentage"];
    }
    if (json["percentChange1y"] is double) {
      percentChange1Y = json["percentChange1y"];
    }
  }

  static List<Quotes> fromList(List<Map<String, dynamic>> list) {
    return list.map(Quotes.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["price"] = price;
    _data["volume24h"] = volume24H;
    _data["volume7d"] = volume7D;
    _data["volumePercentChange"] = volumePercentChange;
    _data["volume30d"] = volume30D;
    _data["marketCap"] = marketCap;
    _data["selfReportedMarketCap"] = selfReportedMarketCap;
    _data["percentChange1h"] = percentChange1H;
    _data["percentChange24h"] = percentChange24H;
    _data["percentChange7d"] = percentChange7D;
    _data["lastUpdated"] = lastUpdated;
    _data["percentChange30d"] = percentChange30D;
    _data["percentChange60d"] = percentChange60D;
    _data["percentChange90d"] = percentChange90D;
    _data["fullyDilluttedMarketCap"] = fullyDilluttedMarketCap;
    _data["marketCapByTotalSupply"] = marketCapByTotalSupply;
    _data["dominance"] = dominance;
    _data["turnover"] = turnover;
    _data["ytdPriceChangePercentage"] = ytdPriceChangePercentage;
    _data["percentChange1y"] = percentChange1Y;
    return _data;
  }
}
