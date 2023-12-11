class PhotoModel {
  String url;

  PhotoModel({required this.url});

  static PhotoModel fromJson(dynamic json) {
    /// the json can be include a url parameter of a src/original parameter
    /// for pexels campaign state and unsplash, it is a url parameter
    /// for pexels initial or raw state, it is src/original
    /// the src/original parameter should come first as seen below because in the
    /// instance where it is needed, the json also includes a url parameter, but what
    /// we want to actually use is the src/original parameter. so the src/original
    /// parameter is taken as priority
    /// unsplash search api uses the urls/thumb property to get photo url
    /// hence this was added
    return PhotoModel(
      url: json['src']?['original'] ?? json['urls']?['thumb'] ?? json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
    };
  }
}
