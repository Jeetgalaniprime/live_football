import 'dart:convert';

class NewsModel {
    final String? title;
    final String? source;
    final String? country;
    final String? url;
    final List<News> items;

    NewsModel({
        this.title,
        this.source,
        this.country,
        this.url,
        this.items = const[],
    });

    factory NewsModel.fromRawJson(String str) => NewsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        title: json["title"],
        source: json["source"],
        country: json["country"],
        url: json["url"],
        items: json["items"] == null ? [] : List<News>.from(json["items"].map((x) => News.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "source": source,
        "country": country,
        "url": url,
        "items": items.isEmpty ? [] : List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class News {
    final String? image;
    final String? title;
    final String? description;
    final String? link;
    final String? ts;
    final String? date;

    News({
        this.image,
        this.title,
        this.description,
        this.link,
        this.ts,
        this.date,
    });

    factory News.fromRawJson(String str) => News.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory News.fromJson(Map<String, dynamic> json) => News(
        image: json["image"],
        title: json["title"],
        description: json["description"],
        link: json["link"],
        ts: json["ts"],
        date: json["date"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "description": description,
        "link": link,
        "ts": ts,
        "date": date,
    };
}
