class MindfullnessExerice {
  final String category;
  final String name;
  final String description;
  final List<String> instructions;
  final int duration;
  final String instructionsUrl;
  final String imagePath;

  MindfullnessExerice({
    required this.category,
    required this.name,
    required this.description,
    required this.instructions,
    required this.duration,
    required this.instructionsUrl,
    required this.imagePath,
  });

  //Method to convert the json data to a MindfullnessExerice object
  factory MindfullnessExerice.fromJson(Map<String, dynamic> json) {
    return MindfullnessExerice(
      category: json['category'],
      name: json['name'],
      description: json['description'],
      instructions: List<String>.from(json['instructions']),
      duration: json['duration'],
      instructionsUrl: json['instructions_url'],
      imagePath: json['image_path'],
    );
  }

  //Method to convert the MindfullnessExerice object to json data
  Map<String,dynamic> toJson() {
    return{
      'category': category,
      'name': name,
      'description': description,
      'instructions': instructions,
      'duration': duration,
      'instructions_url': instructionsUrl,
      'image_path': imagePath,
    };
  }
}