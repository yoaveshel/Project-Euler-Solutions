fn prime_factors(mut n: u64) -> Vec::<u64> {
    let mut limit: u64 = n / 2;
    let mut factors: Vec<u64> = Vec::new();
    let mut i: u64 = 3;
    while i<= limit {
        while n % i == 0 {
            factors.push(i);
            n = n / i;
            limit = n / 2;
        }
        i += 2;
    }
    factors.push(n);
    return factors;
}

fn main() {
    let num: u64 = 600851475143;
    let factors = prime_factors(num);
    println!("{:?}", factors[factors.len()-1]);
}