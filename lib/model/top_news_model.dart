class TopNewsModel {
  int? id;
  String? date;
  String? dateGmt;
  Guid? guid;
  String? modified;
  String? modifiedGmt;
  String? slug;
  String? status;
  String? type;
  String? link;
  Guid? title;
  Guid? content;
  Excerpt? excerpt;
  int? author;
  int? featuredMedia;
  String? commentStatus;
  String? pingStatus;
  bool? sticky;
  String? template;
  String? format;
  Meta? meta;
  List<int>? categories;
  List<int>? tags;
  List<String>? classList;
  String? featuredImageSrc;
  String? ago;
  String? commentCount;
  String? xCategories;
  String? xTags;
  String? xFeaturedMedia;
  String? xFeaturedMediaMedium;
  String? xFeaturedMediaLarge;
  String? xFeaturedMediaOriginal;
  String? xDate;
  String? xAuthor;
  String? xGravatar;
  XMetadata? xMetadata;
  Links? lLinks;

  TopNewsModel(
      {this.id,
        this.date,
        this.dateGmt,
        this.guid,
        this.modified,
        this.modifiedGmt,
        this.slug,
        this.status,
        this.type,
        this.link,
        this.title,
        this.content,
        this.excerpt,
        this.author,
        this.featuredMedia,
        this.commentStatus,
        this.pingStatus,
        this.sticky,
        this.template,
        this.format,
        this.meta,
        this.categories,
        this.tags,
        this.classList,
        this.featuredImageSrc,
        this.ago,
        this.commentCount,
        this.xCategories,
        this.xTags,
        this.xFeaturedMedia,
        this.xFeaturedMediaMedium,
        this.xFeaturedMediaLarge,
        this.xFeaturedMediaOriginal,
        this.xDate,
        this.xAuthor,
        this.xGravatar,
        this.xMetadata,
        this.lLinks});

  TopNewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = json['guid'] != null ? new Guid.fromJson(json['guid']) : null;
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    slug = json['slug'];
    status = json['status'];
    type = json['type'];
    link = json['link'];
    title = json['title'] != null ? new Guid.fromJson(json['title']) : null;
    content =
    json['content'] != null ? new Guid.fromJson(json['content']) : null;
    excerpt =
    json['excerpt'] != null ? new Excerpt.fromJson(json['excerpt']) : null;
    author = json['author'];
    featuredMedia = json['featured_media'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    sticky = json['sticky'];
    template = json['template'];
    format = json['format'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    categories = json['categories'].cast<int>();
    tags = json['tags'].cast<int>();
    classList = json['class_list'].cast<String>();
    featuredImageSrc = json['featured_image_src'];
    ago = json['ago'];
    commentCount = json['comment_count'];
    xCategories = json['x_categories'];
    xTags = json['x_tags'];
    xFeaturedMedia = json['x_featured_media'];
    xFeaturedMediaMedium = json['x_featured_media_medium'];
    xFeaturedMediaLarge = json['x_featured_media_large'];
    xFeaturedMediaOriginal = json['x_featured_media_original'];
    xDate = json['x_date'];
    xAuthor = json['x_author'];
    xGravatar = json['x_gravatar'];
    xMetadata = json['x_metadata'] != null
        ? new XMetadata.fromJson(json['x_metadata'])
        : null;
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['date_gmt'] = this.dateGmt;
    if (this.guid != null) {
      data['guid'] = this.guid!.toJson();
    }
    data['modified'] = this.modified;
    data['modified_gmt'] = this.modifiedGmt;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['type'] = this.type;
    data['link'] = this.link;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    if (this.excerpt != null) {
      data['excerpt'] = this.excerpt!.toJson();
    }
    data['author'] = this.author;
    data['featured_media'] = this.featuredMedia;
    data['comment_status'] = this.commentStatus;
    data['ping_status'] = this.pingStatus;
    data['sticky'] = this.sticky;
    data['template'] = this.template;
    data['format'] = this.format;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['categories'] = this.categories;
    data['tags'] = this.tags;
    data['class_list'] = this.classList;
    data['featured_image_src'] = this.featuredImageSrc;
    data['ago'] = this.ago;
    data['comment_count'] = this.commentCount;
    data['x_categories'] = this.xCategories;
    data['x_tags'] = this.xTags;
    data['x_featured_media'] = this.xFeaturedMedia;
    data['x_featured_media_medium'] = this.xFeaturedMediaMedium;
    data['x_featured_media_large'] = this.xFeaturedMediaLarge;
    data['x_featured_media_original'] = this.xFeaturedMediaOriginal;
    data['x_date'] = this.xDate;
    data['x_author'] = this.xAuthor;
    data['x_gravatar'] = this.xGravatar;
    if (this.xMetadata != null) {
      data['x_metadata'] = this.xMetadata!.toJson();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    return data;
  }
}

class Guid {
  String? rendered;

  Guid({this.rendered});

  Guid.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this.rendered;
    return data;
  }
}

class Excerpt {
  String? rendered;
  bool? protected;

  Excerpt({this.rendered, this.protected});

  Excerpt.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this.rendered;
    data['protected'] = this.protected;
    return data;
  }
}

class Meta {
  String? footnotes;

  Meta({this.footnotes});

  Meta.fromJson(Map<String, dynamic> json) {
    footnotes = json['footnotes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['footnotes'] = this.footnotes;
    return data;
  }
}

class XMetadata {
  String? sThumbnailId;
  String? authorAlias;
  String? overlay;
  String? sYoastWpseoPrimaryCategory;
  String? sYoastWpseoFocuskw;
  String? sYoastWpseoTitle;
  String? sYoastWpseoMetadesc;
  String? sYoastWpseoLinkdex;
  String? sYoastWpseoContentScore;
  String? sYoastWpseoInclusiveLanguageScore;
  String? sYoastWpseoFocuskeywords;
  String? sYoastWpseoKeywordsynonyms;
  String? sYoastWpseoEstimatedReadingTimeMinutes;
  String? sYoastIndexnowLastPing;

  XMetadata(
      {this.sThumbnailId,
        this.authorAlias,
        this.overlay,
        this.sYoastWpseoPrimaryCategory,
        this.sYoastWpseoFocuskw,
        this.sYoastWpseoTitle,
        this.sYoastWpseoMetadesc,
        this.sYoastWpseoLinkdex,
        this.sYoastWpseoContentScore,
        this.sYoastWpseoInclusiveLanguageScore,
        this.sYoastWpseoFocuskeywords,
        this.sYoastWpseoKeywordsynonyms,
        this.sYoastWpseoEstimatedReadingTimeMinutes,
        this.sYoastIndexnowLastPing});

  XMetadata.fromJson(Map<String, dynamic> json) {
    sThumbnailId = json['_thumbnail_id'];
    authorAlias = json['author_alias'];
    overlay = json['overlay'];
    sYoastWpseoPrimaryCategory = json['_yoast_wpseo_primary_category'];
    sYoastWpseoFocuskw = json['_yoast_wpseo_focuskw'];
    sYoastWpseoTitle = json['_yoast_wpseo_title'];
    sYoastWpseoMetadesc = json['_yoast_wpseo_metadesc'];
    sYoastWpseoLinkdex = json['_yoast_wpseo_linkdex'];
    sYoastWpseoContentScore = json['_yoast_wpseo_content_score'];
    sYoastWpseoInclusiveLanguageScore =
    json['_yoast_wpseo_inclusive_language_score'];
    sYoastWpseoFocuskeywords = json['_yoast_wpseo_focuskeywords'];
    sYoastWpseoKeywordsynonyms = json['_yoast_wpseo_keywordsynonyms'];
    sYoastWpseoEstimatedReadingTimeMinutes =
    json['_yoast_wpseo_estimated_reading_time_minutes'];
    sYoastIndexnowLastPing = json['_yoast_indexnow_last_ping'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_thumbnail_id'] = this.sThumbnailId;
    data['author_alias'] = this.authorAlias;
    data['overlay'] = this.overlay;
    data['_yoast_wpseo_primary_category'] = this.sYoastWpseoPrimaryCategory;
    data['_yoast_wpseo_focuskw'] = this.sYoastWpseoFocuskw;
    data['_yoast_wpseo_title'] = this.sYoastWpseoTitle;
    data['_yoast_wpseo_metadesc'] = this.sYoastWpseoMetadesc;
    data['_yoast_wpseo_linkdex'] = this.sYoastWpseoLinkdex;
    data['_yoast_wpseo_content_score'] = this.sYoastWpseoContentScore;
    data['_yoast_wpseo_inclusive_language_score'] =
        this.sYoastWpseoInclusiveLanguageScore;
    data['_yoast_wpseo_focuskeywords'] = this.sYoastWpseoFocuskeywords;
    data['_yoast_wpseo_keywordsynonyms'] = this.sYoastWpseoKeywordsynonyms;
    data['_yoast_wpseo_estimated_reading_time_minutes'] =
        this.sYoastWpseoEstimatedReadingTimeMinutes;
    data['_yoast_indexnow_last_ping'] = this.sYoastIndexnowLastPing;
    return data;
  }
}

class Links {
  List<Self>? self;
  List<Collection>? collection;
  List<Author>? author;
  List<VersionHistory>? versionHistory;
  List<WpTerm>? wpTerm;
  List<Curies>? curies;

  Links(
      {this.self,
        this.collection,
        this.author,
        this.versionHistory,
        this.wpTerm,
        this.curies});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = <Self>[];
      json['self'].forEach((v) {
        self!.add(new Self.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = <Collection>[];
      json['collection'].forEach((v) {
        collection!.add(new Collection.fromJson(v));
      });
    }

    if (json['author'] != null) {
      author = <Author>[];
      json['author'].forEach((v) {
        author!.add(new Author.fromJson(v));
      });
    }

    if (json['version-history'] != null) {
      versionHistory = <VersionHistory>[];
      json['version-history'].forEach((v) {
        versionHistory!.add(new VersionHistory.fromJson(v));
      });
    }

    if (json['wp:term'] != null) {
      wpTerm = <WpTerm>[];
      json['wp:term'].forEach((v) {
        wpTerm!.add(new WpTerm.fromJson(v));
      });
    }
    if (json['curies'] != null) {
      curies = <Curies>[];
      json['curies'].forEach((v) {
        curies!.add(new Curies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self!.map((v) => v.toJson()).toList();
    }
    if (this.collection != null) {
      data['collection'] = this.collection!.map((v) => v.toJson()).toList();
    }

    if (this.author != null) {
      data['author'] = this.author!.map((v) => v.toJson()).toList();
    }

    if (this.versionHistory != null) {
      data['version-history'] =
          this.versionHistory!.map((v) => v.toJson()).toList();
    }

    if (this.wpTerm != null) {
      data['wp:term'] = this.wpTerm!.map((v) => v.toJson()).toList();
    }
    if (this.curies != null) {
      data['curies'] = this.curies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Self {
  String? href;
  TargetHints? targetHints;

  Self({this.href, this.targetHints});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    targetHints = json['targetHints'] != null
        ? new TargetHints.fromJson(json['targetHints'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    if (this.targetHints != null) {
      data['targetHints'] = this.targetHints!.toJson();
    }
    return data;
  }
}

class TargetHints {
  List<String>? allow;

  TargetHints({this.allow});

  TargetHints.fromJson(Map<String, dynamic> json) {
    allow = json['allow'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allow'] = this.allow;
    return data;
  }
}

class Collection {
  String? href;

  Collection({this.href});

  Collection.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Author {
  bool? embeddable;
  String? href;

  Author({this.embeddable, this.href});

  Author.fromJson(Map<String, dynamic> json) {
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['embeddable'] = this.embeddable;
    data['href'] = this.href;
    return data;
  }
}

class VersionHistory {
  int? count;
  String? href;

  VersionHistory({this.count, this.href});

  VersionHistory.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['href'] = this.href;
    return data;
  }
}

class WpTerm {
  String? taxonomy;
  bool? embeddable;
  String? href;

  WpTerm({this.taxonomy, this.embeddable, this.href});

  WpTerm.fromJson(Map<String, dynamic> json) {
    taxonomy = json['taxonomy'];
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['taxonomy'] = this.taxonomy;
    data['embeddable'] = this.embeddable;
    data['href'] = this.href;
    return data;
  }
}

class Curies {
  String? name;
  String? href;
  bool? templated;

  Curies({this.name, this.href, this.templated});

  Curies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    href = json['href'];
    templated = json['templated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['href'] = this.href;
    data['templated'] = this.templated;
    return data;
  }
}
