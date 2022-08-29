fn main() {
    let mut sum = 0;
    let mut f1 = 1;
    let mut f2 = 1;
    let mut temp;
    while f2 <= 4000000 {
        if f2%2==0 {
            sum += f2;
        }
        temp = f1 + f2;
        f1 = f2;
        f2 = temp;
    }
    println!("{}", sum);
}