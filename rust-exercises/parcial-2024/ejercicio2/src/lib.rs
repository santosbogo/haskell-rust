use std::collections::HashMap;

fn main() {
    let mut scores = HashMap::new();
    scores.insert("santos", 98);
    scores.insert("joaquina", 95);
    scores.insert("rufino", 69);
    scores.insert("olivia", 58);

    if let Some(score) = scores.get("santos") {
        println!("{}", score);
    }

    match scores.get("santos") {
        Some(score) => println!("{}", score),
        _ => println!("Not found")
    }

    if scores.contains_key("joaquina") {
        let score = scores["joaquina"];
        assert_eq!(score, 95);
        scores.remove("joaquina");
    }
    assert_eq!(scores.len(), 3);

    for (name, score) in scores {
        println!("The score of {} is {}", name, score)
    }
}