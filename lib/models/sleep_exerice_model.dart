class SleepExerice {
  final String category;
  final String name;
  final String description;
  final int duration;
  final String audioUrl;

  SleepExerice(
      {required this.category,
      required this.name,
      required this.description,
      required this.duration,
      required this.audioUrl
      });
  
  //Method to convert the json data to a SleepExerice object
  factory SleepExerice.fromJson(Map<String,dynamic>json){
    return SleepExerice(
      category: json['category'],
      name: json['name'],
      description: json['description'],
      duration: json['duration'],
      audioUrl: json['audio_url']
    );
  }
  //Method to convert the SleepExerice object to json data
  Map<String,dynamic> toJson() {
    return {
      'category': category,
      'name': name,
      'description': description,
      'duration': duration,
      'audio_url': audioUrl
    };
  }
}
