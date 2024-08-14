String trimFileExtension(String title) {
  return title.replaceAll(
      RegExp(r'\.(mp3|opus|m4a|wav|flac|aac|ogg|wma|com)$'), '');
}

String truncate(String text, int maxLength) {
  if (text.length <= maxLength) return text;
  return text.substring(0, maxLength) + '...';
}
