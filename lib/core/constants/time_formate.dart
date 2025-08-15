// to get time format
String formatTime(String publishedAt) {
  final dateTime = DateTime.tryParse(publishedAt);
  if (dateTime == null) return '';
  final diff = DateTime.now().difference(dateTime);
  if (diff.inHours < 1) return '${diff.inMinutes}m ago';
  if (diff.inHours < 24) return '${diff.inHours}h ago';
  return '${diff.inDays}d ago';
}

