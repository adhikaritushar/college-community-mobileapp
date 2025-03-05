import 'package:url_launcher/url_launcher.dart';

Future<void> openPdfFromUrl(String pdfUrl) async {
  final Uri url = Uri.parse(pdfUrl);

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not open the PDF';
  }
}
