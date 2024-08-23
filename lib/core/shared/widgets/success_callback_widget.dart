part of 'widget.dart';

class SuccessCallbackWidget extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;

  const SuccessCallbackWidget({
    super.key,
    required this.title,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 75.0),
                  Image.asset(
                    'assets/images/success.png',
                    height: 250.0,
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 8.0),
                  _buildTextWithHashtags(description, context),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                ButtonWidget(
                  title: 'Continue',
                  onPressed: onPressed,
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextWithHashtags(String text, BuildContext context) {
    final RegExp hashtagRegExp = RegExp(r'(#\w+)');

    final List<TextSpan> spans = [];
    final Iterable<Match> matches = hashtagRegExp.allMatches(text);

    int lastMatchEnd = 0;

    for (final Match match in matches) {
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(text: text.substring(lastMatchEnd, match.start)));
      }

      spans.add(TextSpan(
        text: match.group(0),
        style: Theme.of(context).textTheme.labelMedium,
      ));

      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(text: text.substring(lastMatchEnd)));
    }

    return RichText(
      text: TextSpan(
        children: spans,
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: ADSColor.textSecondary),
      ),
      textAlign: TextAlign.center,
    );
  }
}
