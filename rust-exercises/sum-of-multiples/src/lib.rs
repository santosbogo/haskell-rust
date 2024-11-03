use std::collections::HashSet;

pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    factors
        .iter()
        .filter(|&&factor| factor != 0) // Ignorar el factor 0 para evitar divisiones por cero
        .flat_map(|&factor| (factor..limit).step_by(factor as usize)) // Generar múltiplos
        .collect::<HashSet<_>>() // Crear un HashSet para evitar duplicados
        .iter()
        .sum() // Sumar los elementos únicos
}