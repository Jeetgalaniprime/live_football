import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    List<AiImageswap>? aiImageswap;

    CategoryModel({
        this.aiImageswap,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        aiImageswap: json["ai_imageswap"] == null ? [] : List<AiImageswap>.from(json["ai_imageswap"]!.map((x) => AiImageswap.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ai_imageswap": aiImageswap == null ? [] : List<dynamic>.from(aiImageswap!.map((x) => x.toJson())),
    };
}

class AiImageswap {
    String? id;
    String? catrgoryName;
    String? catMainImg;
    List<String>? catImage;

    AiImageswap({
        this.id,
        this.catrgoryName,
        this.catMainImg,
        this.catImage,
    });

    factory AiImageswap.fromJson(Map<String, dynamic> json) => AiImageswap(
        id: json["id"],
        catrgoryName: json["catrgory_name"],
        catMainImg: json["cat_main_img"],
        catImage: json["cat_image"] == null ? [] : List<String>.from(json["cat_image"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "catrgory_name": catrgoryName,
        "cat_main_img": catMainImg,
        "cat_image": catImage == null ? [] : List<dynamic>.from(catImage!.map((x) => x)),
    };
}
