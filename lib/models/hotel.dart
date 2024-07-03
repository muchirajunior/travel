class Hotel {
  final int? id;
  final String? name;
  final String? description;
  final String? location;
  final String? country;
  final String? state;
  final String? county;
  final String? constituency;
  final String? village;
  final String? region;
  final String? town;
  final String? street;
  final String? address;
  final String? zipcode;
  final String? classification;
  final String? isActive;
  final String? createdOn;
  final String? createdBy;
  final String? createdAt;
  final String? updatedAt;
  final List<MediaImage> mediaImages;

  Hotel({
    this.id,
    this.name,
    this.description,
    this.location,
    this.country,
    this.state,
    this.county,
    this.constituency,
    this.village,
    this.region,
    this.town,
    this.street,
    this.address,
    this.zipcode,
    this.classification,
    this.isActive,
    this.createdOn,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.mediaImages = const [],
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    var mediaImagesJson = json['media_images'] as List?;
    List<MediaImage> mediaImages = mediaImagesJson != null
        ? mediaImagesJson.map((i) => MediaImage.fromJson(i)).toList()
        : [];

    return Hotel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      location: json['location'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      county: json['county'] as String?,
      constituency: json['constituency'] as String?,
      village: json['village'],
      region: json['region'] as String?,
      town: json['town'] as String?,
      street: json['street'] as String?,
      address: json['address'] as String?,
      zipcode: json['zipcode'] as String?,
      classification: json['classification'] as String?,
      isActive: json['isActive'] as String?,
      createdOn: json['createdOn'],
      createdBy: json['createdBy'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      mediaImages: mediaImages,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'location': location,
      'country': country,
      'state': state,
      'county': county,
      'constituency': constituency,
      'village': village,
      'region': region,
      'town': town,
      'street': street,
      'address': address,
      'zipcode': zipcode,
      'classification': classification,
      'isActive': isActive,
      'createdOn': createdOn,
      'createdBy': createdBy,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'media_images': mediaImages.map((e) => e.toJson()).toList(),
    };
  }
}

class MediaImage {
  final int? id;
  final String? hotelId;
  final String? uuid;
  final String? collectionName;
  final String? name;
  final String? fileName;
  final String? mimeType;
  final String? disk;
  final String? conversionsDisk;
  final String? size;
  final String? manipulations;
  final String? customProperties;
  final String? generatedConversions;
  final String? responsiveImages;
  final String? orderColumn;
  final String? createdAt;
  final String? updatedAt;

  MediaImage({
    this.id,
    this.hotelId,
    this.uuid,
    this.collectionName,
    this.name,
    this.fileName,
    this.mimeType,
    this.disk,
    this.conversionsDisk,
    this.size,
    this.manipulations,
    this.customProperties,
    this.generatedConversions,
    this.responsiveImages,
    this.orderColumn,
    this.createdAt,
    this.updatedAt,
  });

  factory MediaImage.fromJson(Map<String, dynamic> json) {
    return MediaImage(
      id: json['id'] as int?,
      hotelId: json['hotel_id'] as String?,
      uuid: json['uuid'],
      collectionName: json['collection_name'],
      name: json['name'],
      fileName: json['file_name'] as String?,
      mimeType: json['mime_type'],
      disk: json['disk'],
      conversionsDisk: json['conversions_disk'],
      size: json['size'],
      manipulations: json['manipulations'],
      customProperties: json['custom_properties'],
      generatedConversions: json['generated_conversions'],
      responsiveImages: json['responsive_images'],
      orderColumn: json['order_column'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hotel_id': hotelId,
      'uuid': uuid,
      'collection_name': collectionName,
      'name': name,
      'file_name': fileName,
      'mime_type': mimeType,
      'disk': disk,
      'conversions_disk': conversionsDisk,
      'size': size,
      'manipulations': manipulations,
      'custom_properties': customProperties,
      'generated_conversions': generatedConversions,
      'responsive_images': responsiveImages,
      'order_column': orderColumn,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
