fn is_prime(n: u32, primes: Vec<u32>) -> bool {
    for p in primes.iter() {
        if n % p == 0 {
            return false;
        }
    }
    true
}

pub fn nth(n: u32) -> u32 {
    let mut primes = vec![2];
    for i in 3..std::u32::MAX {
        if is_prime(i, primes.clone()) {
            primes.push(i);
        }
        if primes.len() as u32 > n {
            break;
        }
    }
    *primes.get(n as usize).unwrap()
}
