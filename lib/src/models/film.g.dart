// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Film _$FilmFromJson(Map<String, dynamic> json) => Film(
      id: json['id'] as String?,
      title: json['title'] as String?,
      originalTitle: json['originalTitle'] as String?,
      originalTitleRomanised: json['originalTitleRomanised'] as String?,
      description: json['description'] as String?,
      director: json['director'] as String?,
      producer: json['producer'] as String?,
      releaseDate: json['releaseDate'] as String?,
      runningTime: json['runningTime'] as String?,
      rtScore: json['rtScore'] as String?,
      people:
          (json['people'] as List<dynamic>?)?.map((e) => e as String).toList(),
      species:
          (json['species'] as List<dynamic>?)?.map((e) => e as String).toList(),
      locations: (json['locations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      vehicles: (json['vehicles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      url: json['url'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$FilmToJson(Film instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'originalTitle': instance.originalTitle,
      'originalTitleRomanised': instance.originalTitleRomanised,
      'description': instance.description,
      'director': instance.director,
      'producer': instance.producer,
      'releaseDate': instance.releaseDate,
      'runningTime': instance.runningTime,
      'rtScore': instance.rtScore,
      'people': instance.people,
      'species': instance.species,
      'locations': instance.locations,
      'vehicles': instance.vehicles,
      'url': instance.url,
      'image': instance.image,
    };
