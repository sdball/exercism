// fancy!
fn divisible_by(n: u32) -> impl Fn(u32) -> bool {
    // ooh closure
    move |x| x % n == 0
}

pub fn raindrops(n: u32) -> String {
    let mut messages = Vec::new();

    // just trying out some currying in Rust ^_^
    let divisible_by_3 = divisible_by(3);
    let divisible_by_5 = divisible_by(5);
    let divisible_by_7 = divisible_by(7);

    if divisible_by_3(n) {
        messages.push(String::from("Pling"));
    }

    if divisible_by_5(n) {
        messages.push(String::from("Plang"));
    }

    if divisible_by_7(n) {
        messages.push(String::from("Plong"));
    }

    if messages.is_empty() {
        messages.push(n.to_string());
    }

    return messages.join("");
}
