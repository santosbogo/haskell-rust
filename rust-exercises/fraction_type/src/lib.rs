use std::ops;

#[derive(Debug, PartialEq, Eq)]
pub struct Fraction(pub i32, pub i32);

impl Fraction {
    pub fn add(self, other: Fraction) -> Fraction {
        let numerator = self.0 * other.1 + self.1 * other.0;
        let denominator = self.1 * other.1;
        simplify(numerator, denominator)
    }

    pub fn sub(self, other: Fraction) -> Fraction {
        let numerator = self.0 * other.1 - self.1 * other.0;
        let denominator = self.1 * other.1;
        simplify(numerator, denominator)
    }

    pub fn mul(self, other: Fraction) -> Fraction {
        let numerator = self.0 * other.0;
        let denominator = self.1 * other.1;
        simplify(numerator, denominator)
    }

    pub fn divide(self, other: Fraction) -> Fraction {
        let numerator = self.0 * other.1;
        let denominator = self.1 * other.0;
        simplify(numerator, denominator)
    }
}

impl ops::Add for Fraction {
    type Output = Fraction;

    fn add(self, other: Fraction) -> Fraction {
        self.add(other)
    }
}

/// Calculate the Highest common factor between 2 numbers
fn hcf(a: i32, b: i32) -> i32 {
    if b == 0 {
        a
    } else {
        hcf(b, a % b)
    }
}

fn simplify(n: i32, d: i32) -> Fraction {
    let divisor = hcf(n, d);
    let (num, den) = (n / divisor, d / divisor);

    if den < 0 {
        Fraction(-num, -den)
    } else {
        Fraction(num, den)
    }
}