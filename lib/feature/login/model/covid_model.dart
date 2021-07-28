class Covid {
  AllRoute? allRoute;
  AllRoute? countriesRoute;
  AllRoute? countryStatusDayOneLiveRoute;
  AllRoute? countryStatusDayOneRoute;
  AllRoute? countryStatusDayOneTotalRoute;
  AllRoute? countryStatusLiveRoute;
  AllRoute? countryStatusRoute;
  AllRoute? countryStatusTotalRoute;
  AllRoute? exportRoute;
  AllRoute? liveCountryStatusAfterDateRoute;
  AllRoute? liveCountryStatusRoute;
  AllRoute? summaryRoute;
  AllRoute? webhookRoute;

  Covid(
      {this.allRoute,
      this.countriesRoute,
      this.countryStatusDayOneLiveRoute,
      this.countryStatusDayOneRoute,
      this.countryStatusDayOneTotalRoute,
      this.countryStatusLiveRoute,
      this.countryStatusRoute,
      this.countryStatusTotalRoute,
      this.exportRoute,
      this.liveCountryStatusAfterDateRoute,
      this.liveCountryStatusRoute,
      this.summaryRoute,
      this.webhookRoute});

  Covid.fromJson(Map<String, dynamic> json) {
    allRoute = json['allRoute'] != null
        ? new AllRoute.fromJson(json['allRoute'])
        : null;
    countriesRoute = json['countriesRoute'] != null
        ? new AllRoute.fromJson(json['countriesRoute'])
        : null;
    countryStatusDayOneLiveRoute = json['countryStatusDayOneLiveRoute'] != null
        ? new AllRoute.fromJson(json['countryStatusDayOneLiveRoute'])
        : null;
    countryStatusDayOneRoute = json['countryStatusDayOneRoute'] != null
        ? new AllRoute.fromJson(json['countryStatusDayOneRoute'])
        : null;
    countryStatusDayOneTotalRoute =
        json['countryStatusDayOneTotalRoute'] != null
            ? new AllRoute.fromJson(json['countryStatusDayOneTotalRoute'])
            : null;
    countryStatusLiveRoute = json['countryStatusLiveRoute'] != null
        ? new AllRoute.fromJson(json['countryStatusLiveRoute'])
        : null;
    countryStatusRoute = json['countryStatusRoute'] != null
        ? new AllRoute.fromJson(json['countryStatusRoute'])
        : null;
    countryStatusTotalRoute = json['countryStatusTotalRoute'] != null
        ? new AllRoute.fromJson(json['countryStatusTotalRoute'])
        : null;
    exportRoute = json['exportRoute'] != null
        ? new AllRoute.fromJson(json['exportRoute'])
        : null;
    liveCountryStatusAfterDateRoute =
        json['liveCountryStatusAfterDateRoute'] != null
            ? new AllRoute.fromJson(json['liveCountryStatusAfterDateRoute'])
            : null;
    liveCountryStatusRoute = json['liveCountryStatusRoute'] != null
        ? new AllRoute.fromJson(json['liveCountryStatusRoute'])
        : null;
    summaryRoute = json['summaryRoute'] != null
        ? new AllRoute.fromJson(json['summaryRoute'])
        : null;
    webhookRoute = json['webhookRoute'] != null
        ? new AllRoute.fromJson(json['webhookRoute'])
        : null;
  }
}

class AllRoute {
  String? name;
  String? description;
  String? path;

  AllRoute({this.name, this.description, this.path});

  AllRoute.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    description = json['Description'];
    path = json['Path'];
  }
}
