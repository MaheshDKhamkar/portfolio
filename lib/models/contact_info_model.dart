/// Contact information model
class ContactInfoModel {
  final String name;
  final String email;
  final String subject;
  final String message;

  const ContactInfoModel({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
  });

  /// Validate email format
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  /// Validate phone number format (basic validation)
  static bool isValidPhone(String phone) {
    final phoneRegex = RegExp(r'^\+?[\d\s\-\(\)]{10,}$');
    return phoneRegex.hasMatch(phone);
  }

  /// Validate name (not empty and reasonable length)
  static String? validateName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return 'Name is required';
    }
    if (name.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }
    if (name.trim().length > 50) {
      return 'Name must be less than 50 characters';
    }
    return null;
  }

  /// Validate email
  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Email is required';
    }
    if (!isValidEmail(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  /// Validate subject
  static String? validateSubject(String? subject) {
    if (subject == null || subject.trim().isEmpty) {
      return 'Subject is required';
    }
    if (subject.trim().length < 3) {
      return 'Subject must be at least 3 characters';
    }
    if (subject.trim().length > 100) {
      return 'Subject must be less than 100 characters';
    }
    return null;
  }

  /// Validate message
  static String? validateMessage(String? message) {
    if (message == null || message.trim().isEmpty) {
      return 'Message is required';
    }
    if (message.trim().length < 10) {
      return 'Message must be at least 10 characters';
    }
    if (message.trim().length > 1000) {
      return 'Message must be less than 1000 characters';
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'subject': subject,
      'message': message,
    };
  }

  factory ContactInfoModel.fromJson(Map<String, dynamic> json) {
    return ContactInfoModel(
      name: json['name'] as String,
      email: json['email'] as String,
      subject: json['subject'] as String,
      message: json['message'] as String,
    );
  }
}
