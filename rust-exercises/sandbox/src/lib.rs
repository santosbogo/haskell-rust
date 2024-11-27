trait Person {
    fn first_name (&self) -> &String;
    fn document(&self) -> String;
    fn full_name(&self) -> String {format!("{} {}", self.first_name(), self.document())}
}

#[derive(Debug)]
struct Student {
    id: i32,
    name: String,
    active: bool,
}

impl Person for Student {
    fn first_name(&self) -> &String {
        &self.name
    }

    fn document(&self) -> String {
        self.id.to_string()
    }
}

impl Student {
    fn new(id: i32, name: String, active: bool) -> Self{
        Student{id, name, active }
    }

    fn update_active_inmutable(self, new_active: bool) -> Self {
        Student{id: self.id, name: self.name, active: new_active}
    }

    fn update_active_mutable(&mut self, new_active: bool) {
        self.active = new_active;
    }

    fn print_data(self) {
        println!("Name: {}, id: {}, active: {}", self.name, self.id, self.active)
    }
}


fn main() {

    {
        // fn wrong_max<T>(list: &[T]) -> &T {
        //     let mut max = &list[0];
        //
        //     for item in list {
        //         if item > max { max = item }
        //     }
        //     max
        // }
        // println!("{}", wrong_max(&[4, 1, 2, 3])); // Error: T no tiene implementado >
    }
    {
        // fn max<T: Ord>(list: &[T]) -> &T {
        //     let mut max = &list[0];
        //
        //     for item in list {
        //         if item > max { max = item }
        //     }
        //     max
        // }
        // println!("{}", max(&[4, 1, 2, 3]));
        // println!("{}", max(&vec!("aa", "hello", "b")))
    }

    {
        let mut mutable_s = Student::new(1, String::from("Santos"), false);
        let inmutable_s = Student::new(3, String::from("Rufino"), false);

        mutable_s.update_active_mutable(true);
        let inmutable_s = inmutable_s.update_active_inmutable(true);

        println!("{:?}", mutable_s);
        println!("{:?}", inmutable_s);
    }

    {
        //     let mut n = 100;
        //     {
        //         let pn = &mut n; // Guarda la dirección de memoria de n
        //         // println!("n={} adress of n = {:p} value = {}", n, pn, *pn);
        //         println!("adress of n = {:p} value = {}", pn, *pn);
        //
        //         *pn = 150;
        //         println!("*pn = 150 = {}", *pn);
        //
        //         let a = *pn + 100;
        //         println!("a = *pn + 100 = {}", a)
        //     }
        //
        //     println!("n={}", n);
    }

    {//TODO: NO FUNCIONA
        // let mut n = 100;
        // let mut m = 200;
        // let mut pn = &mut n;
        // *pn += 1;
        // pn = &mut m;
        // *pn += 1;
        // println!("n = {n}, m = {m}");
        // println!("pn = {pn}");
    }
    { //TODO: FUNCIONA
        // let mut n = 100;
        // let mut m = 200;
        // let mut pn = &mut n;
        // *pn += 1;
        // pn = &mut m;
        // *pn += 1;
        // println!("pn = {pn}");
        // println!("n = {n}, m = {m}");
    }

    {//TODO: Funciona, cambie la funcion print_str para que reciba &String en lugar de String. Tambien cuando es llamada le paso la direccion de s (&s)
        // fn print_str(s: &String){
        //     println!("{}", s);
        // }
        // let s = String::from("hello, world");
        // print_str(&s);
        // println!("{}", s)
    }

    { //TODO: Funciona cambie que s no sea mutable. Tambien solamente cambiando que las referencias no sean mutables funcionaba igual
        // let s = String::from("hello");
        // let r1 = &s;
        // let r2 = &s;
        // println!("{}, {}", r1, r2);
    }

    {
        // let x = Box::new(5);
        // let mut y = Box::new(2);
        // *y = 4;
        // assert_eq!(*x, 5);
        // println!("Success!");
    }
}