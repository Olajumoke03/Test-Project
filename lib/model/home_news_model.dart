

class HomeNewsModel {
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
  Content? content;
  Content? excerpt;
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
  String? featuredImageSrc;
  String? ago;
  String? commentCount;
  Links? lLinks;

  HomeNewsModel({
    this.id,
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
    this.featuredImageSrc,
    this.ago,
    this.commentCount,
    this.lLinks,
  });

  HomeNewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = json['guid'] != null ? Guid.fromJson(json['guid']) : null;
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    slug = json['slug'];
    status = json['status'];
    type = json['type'];
    link = json['link'];
    title = json['title'] != null ? Guid.fromJson(json['title']) : null;
    content = json['content'] != null ? Content.fromJson(json['content']) : null;
    excerpt = json['excerpt'] != null ? Content.fromJson(json['excerpt']) : null;
    author = json['author'];
    featuredMedia = json['featured_media'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    sticky = json['sticky'];
    template = json['template'];
    format = json['format'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    categories = json['categories']?.cast<int>();
    tags = json['tags']?.cast<int>();
    featuredImageSrc = json['featured_image_src'];
    ago = json['ago'];
    commentCount = json['comment_count'];
    lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['date_gmt'] = dateGmt;
    if (guid != null) {
      data['guid'] = guid!.toJson();
    }
    data['modified'] = modified;
    data['modified_gmt'] = modifiedGmt;
    data['slug'] = slug;
    data['status'] = status;
    data['type'] = type;
    data['link'] = link;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (content != null) {
      data['content'] = content!.toJson();
    }
    if (excerpt != null) {
      data['excerpt'] = excerpt!.toJson();
    }
    data['author'] = author;
    data['featured_media'] = featuredMedia;
    data['comment_status'] = commentStatus;
    data['ping_status'] = pingStatus;
    data['sticky'] = sticky;
    data['template'] = template;
    data['format'] = format;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['categories'] = categories;
    data['tags'] = tags;
    data['featured_image_src'] = featuredImageSrc;
    data['ago'] = ago;
    data['comment_count'] = commentCount;
    if (lLinks != null) {
      data['_links'] = lLinks!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return {
      'id': id,
      'date': date,
      'date_gmt': dateGmt,
      'guid': {'rendered': guid?.rendered},
      'modified': modified,
      'modified_gmt': modifiedGmt,
      'slug': slug,
      'status': status,
      'type': type,
      'link': link,
      'title': {'rendered': title?.rendered},
      'content': {'rendered': content?.rendered},
      'excerpt': {'rendered': excerpt?.rendered},
      'author': author,
      'featured_media': featuredMedia,
      'comment_status': commentStatus,
      'ping_status': pingStatus,
      'sticky': sticky,
      'template': template,
      'format': format,
      'meta': meta?.toJson(),
      'categories': categories,
      'tags': tags,
      'featured_image_src': featuredImageSrc,
      'ago': ago,
      'comment_count': commentCount,
      '_links': lLinks?.toJson()
    }.toString();
  }
}

class Guid {
  String? rendered;

  Guid({this.rendered});

  Guid.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rendered'] = rendered;
    return data;
  }

  @override
  String toString() {
    return 'Guid{rendered: $rendered}';
  }
}

class Content {
  String? rendered;
  bool? protected;

  Content({this.rendered, this.protected});

  Content.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
    protected = json['protected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rendered'] = rendered;
    data['protected'] = protected;
    return data;
  }

  @override
  String toString() {
    return 'Content{rendered: $rendered, protected: $protected}';
  }
}

class Meta {
  String? footnotes;

  Meta({this.footnotes});

  Meta.fromJson(Map<String, dynamic> json) {
    footnotes = json['footnotes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['footnotes'] = footnotes;
    return data;
  }

  @override
  String toString() {
    return 'Meta{footnotes: $footnotes}';
  }
}

class Links {
  List<Self>? self;
  List<Collection>? collection;
  List<About>? about;
  List<Author>? author;
  List<Replies>? replies;
  List<VersionHistory>? versionHistory;
  List<WpFeaturedmedia>? wpFeaturedmedia;
  List<WpAttachment>? wpAttachment;
  List<WpTerm>? wpTerm;
  List<Curies>? curies;

  Links({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
    this.versionHistory,
    this.wpFeaturedmedia,
    this.wpAttachment,
    this.wpTerm,
    this.curies,
  });

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self']?.map<Self>((v) => Self.fromJson(v)).toList();
    // collection = json['collection']?.map<Collection>((v) => Collection.fromJson(v)).toList();
    // about = json['about']?.map<About>((v) => About.fromJson(v)).toList();
    author = json['author']?.map<Author>((v) => Author.fromJson(v)).toList();
    // replies = json['replies']?.map<Replies>((v) => Replies.fromJson(v)).toList();
    versionHistory = json['version-history']?.map<VersionHistory>((v) => VersionHistory.fromJson(v)).toList();
    // wpFeaturedmedia = json['wp:featuredmedia']?.map<WpFeaturedmedia>((v) => WpFeaturedmedia.fromJson(v)).toList();
    // wpAttachment = json['wp:attachment']?.map<WpAttachment>((v) => WpAttachment.fromJson(v)).toList();
    wpTerm = json['wp:term']?.map<WpTerm>((v) => WpTerm.fromJson(v)).toList();
    curies = json['curies']?.map<Curies>((v) => Curies.fromJson(v)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (self != null) {
      data['self'] = self!.map((v) => v.toJson()).toList();
    }
    if (collection != null) {
      data['collection'] = collection!.map((v) => v.toJson()).toList();
    }
    if (about != null) {
      data['about'] = about!.map((v) => v.toJson()).toList();
    }
    if (author != null) {
      data['author'] = author!.map((v) => v.toJson()).toList();
    }
    if (replies != null) {
      data['replies'] = replies!.map((v) => v.toJson()).toList();
    }
    if (versionHistory != null) {
      data['version-history'] = versionHistory!.map((v) => v.toJson()).toList();
    }
    if (wpFeaturedmedia != null) {
      data['wp:featuredmedia'] = wpFeaturedmedia!.map((v) => v.toJson()).toList();
    }
    if (wpAttachment != null) {
      data['wp:attachment'] = wpAttachment!.map((v) => v.toJson()).toList();
    }
    if (wpTerm != null) {
      data['wp:term'] = wpTerm!.map((v) => v.toJson()).toList();
    }
    if (curies != null) {
      data['curies'] = curies!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return '''
Links {
  self: $self,
  collection: $collection,
  about: $about,
  author: $author,
  replies: $replies,
  versionHistory: $versionHistory,
  wpFeaturedmedia: $wpFeaturedmedia,
  wpAttachment: $wpAttachment,
  wpTerm: $wpTerm,
  curies: $curies
}''';
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    return data;
  }

  @override
  String toString() {
    return 'Self{href: $href}';
  }
}

class Collection extends Self {
  Collection({String? href}) : super(href: href);
}

class About extends Self {
  About({String? href}) : super(href: href);
}

class Replies extends Author {
  Replies({bool? embeddable, String? href}) : super(embeddable: embeddable, href: href);
}

class WpFeaturedmedia extends Author {
  WpFeaturedmedia({bool? embeddable, String? href}) : super(embeddable: embeddable, href: href);
}

class WpAttachment extends Self {
  WpAttachment({String? href}) : super(href: href);
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['embeddable'] = embeddable;
    data['href'] = href;
    return data;
  }

  @override
  String toString() {
    return 'Author{embeddable: $embeddable, href: $href}';
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['href'] = href;
    return data;
  }

  @override
  String toString() {
    return 'VersionHistory{count: $count, href: $href}';
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['taxonomy'] = taxonomy;
    data['embeddable'] = embeddable;
    data['href'] = href;
    return data;
  }

  @override
  String toString() {
    return 'WpTerm{taxonomy: $taxonomy, embeddable: $embeddable, href: $href}';
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['href'] = href;
    data['templated'] = templated;
    return data;
  }

  @override
  String toString() {
    return 'Curies{name: $name, href: $href, templated: $templated}';
  }
}