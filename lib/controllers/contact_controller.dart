import 'package:url_launcher/url_launcher.dart';
import '../models/contact_info_model.dart';

/// Contact controller - handles contact business logic
class ContactController {
  /// Submit contact form
  /// In a real app, this would send data to a backend API
  Future<bool> submitContactForm(ContactInfoModel contactInfo) async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 1000));

      // In a real app, you would send this to your backend
      // For now, we'll just simulate success
      print('Contact form submitted:');
      print('Name: ${contactInfo.name}');
      print('Email: ${contactInfo.email}');
      print('Subject: ${contactInfo.subject}');
      print('Message: ${contactInfo.message}');

      return true;
    } catch (e) {
      return false;
    }
  }

  /// Launch email client
  Future<bool> launchEmail(
    String email, {
    String? subject,
    String? body,
  }) async {
    try {
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: email,
        queryParameters: {
          if (subject != null) 'subject': subject,
          if (body != null) 'body': body,
        },
      );
      return await launchUrl(emailUri);
    } catch (e) {
      return false;
    }
  }

  /// Launch phone dialer
  Future<bool> launchPhone(String phoneNumber) async {
    try {
      final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
      return await launchUrl(phoneUri);
    } catch (e) {
      return false;
    }
  }

  /// Launch SMS
  Future<bool> launchSMS(String phoneNumber, {String? body}) async {
    try {
      final Uri smsUri = Uri(
        scheme: 'sms',
        path: phoneNumber,
        queryParameters: {if (body != null) 'body': body},
      );
      return await launchUrl(smsUri);
    } catch (e) {
      return false;
    }
  }

  /// Launch social media URL
  Future<bool> launchSocialMedia(String url) async {
    try {
      final uri = Uri.parse(url);
      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      return false;
    }
  }
}
