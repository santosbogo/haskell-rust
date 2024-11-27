fn rna_to_protein(rna: &str) -> Vec<String> {
    let mut proteins = Vec::new();

    let codons: Vec<&str> = rna.as_bytes()
        .chunks(3)
        .map(|chunk| std::str::from_utf8(chunk).unwrap())
        .collect();

    for codon in codons {
        let protein = match codon {
            "AUG" => Some("Methionine"),
            "UUU" | "UUC" => Some("Phenylalanine"),
            "UUA" | "UUG" => Some("Leucine"),
            "UCU" | "UCC" | "UCA" | "UCG" => Some("Serine"),
            "UAU" | "UAC" => Some("Tyrosine"),
            "UGU" | "UGC" => Some("Cysteine"),
            "UGG" => Some("Tryptophan"),
            "UAA" | "UAG" | "UGA" => None,
            _ => None,
        };

        if protein.is_none() {
            break;
        }

        // Otherwise, push the protein to the result list
        if let Some(protein) = protein {
            proteins.push(protein.to_string());
        }
    }

    proteins
}