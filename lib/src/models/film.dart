import 'package:json_annotation/json_annotation.dart';

part 'film.g.dart';

@JsonSerializable()
class Film {
  String? _id;
  String? _title;
  @JsonKey(name: 'original_title')
  String? _originalTitle;
  @JsonKey(name: 'original_title_romanised')
  String? _originalTitleRomanised;
  String? _image;
  String? _description;
  String? _director;
  String? _producer;
  @JsonKey(name: 'release_date')
  String? _releaseDate;
  @JsonKey(name: 'running_time')
  String? _runningTime;
  @JsonKey(name: 'rt_score')
  String? _rtScore;
  List<String>? _people;
  List<String>? _species;
  List<String>? _locations;
  List<String>? _vehicles;
  String? _url;

  Film(
      {String? id,
      String? title,
      String? originalTitle,
      String? originalTitleRomanised,
      String? description,
      String? director,
      String? producer,
      String? releaseDate,
      String? runningTime,
      String? rtScore,
      List<String>? people,
      List<String>? species,
      List<String>? locations,
      List<String>? vehicles,
      String? url,
      String? image}) {
    _id = id;
    _title = title;
    _originalTitle = originalTitle;
    _originalTitleRomanised = originalTitleRomanised;
    _description = description;
    _director = director;
    _producer = producer;
    _releaseDate = releaseDate;
    _runningTime = runningTime;
    _rtScore = rtScore;
    _people = people;
    _species = species;
    _locations = locations;
    _vehicles = vehicles;
    _url = url;
    _image = image;
  }

  String? get id => _id;

  String? get title => _title;

  get originalTitle => _originalTitle;

  get originalTitleRomanised => _originalTitleRomanised;

  get description => _description;

  get director => _director;

  get producer => _producer;

  get releaseDate => _releaseDate;

  get runningTime => _runningTime;

  get rtScore => _rtScore;

  get people => _people;

  get species => _species;

  get locations => _locations;

  get vehicles => _vehicles;

  get url => _url;

  get image => _image;

  factory Film.fromJson(json) => _$FilmFromJson(json);

  Map<String, dynamic> toJson() => _$FilmToJson(this);
}
