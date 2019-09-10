pub fn is_leap_year(year: u64) -> bool {
    let year_is_divisible_by = move |n| year % n == 0;
    year_is_divisible_by(400) || (year_is_divisible_by(4) && !year_is_divisible_by(100))
}
