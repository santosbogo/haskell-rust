use std::collections::HashMap;

/// Count occurrences of words.
pub fn word_count(phrase: &str) -> HashMap<String, u32> {
  // Mutable hash map. Key: word; Value: occurrence
  let mut counts = HashMap::new();

  // Visit each word of all text in lowercase and each word separated by a whitespace
  for word in phrase.to_lowercase().split_whitespace() {
    *counts.entry(word.to_string()).or_insert(0) += 1;
  }

  counts
}