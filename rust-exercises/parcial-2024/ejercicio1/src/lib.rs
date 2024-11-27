#[derive(Debug)]
struct Stack<T>(Option<Box<Node<T>>>);

impl<T> Clone for Stack<T>{
    fn clone(&self) -> Self{

    }
}