
fn main() {
    {
        fn print_str(s: &String){
            println!("{}", s);
        }

        let s = String::from("hello, world");
        print_str(&s);
        println!("{}", s);
    }

    {
        let mut s = String::from("hello");
        let r1 = &s;
        let r2 = &s;
        println!("{}, {}", r1, r2)
    }

    {
        let x = Box::new(5);
        let mut y = Box::new(3);
        *y = 4;
        assert_eq!(*x, 5);
        println!("Success");
    }


}
