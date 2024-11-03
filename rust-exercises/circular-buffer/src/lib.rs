#[derive(Debug, PartialEq)]
pub enum Error {
    EmptyBuffer,
    FullBuffer,
}

pub struct CircularBuffer<T:Clone> {
    buffer: Vec<Option<T>>,
    size: usize,
    next: usize,
}

impl<T:Clone> CircularBuffer<T> {
    pub fn new(size: usize) -> CircularBuffer<T> {
        CircularBuffer {
            buffer: vec![None; size],
            size: 0,
            next: 0,
        }
    }

    pub fn read(&mut self) -> Result<T, Error> {
        if self.is_empty() {
            return Err(Error::EmptyBuffer)
        }

        let read_index = (self.next + self.buffer.len() - self.size) % self.buffer.len();
        let value = self.buffer[read_index].take().unwrap();
        self.size -= 1;
        Ok(value)
    }

    pub fn write(&mut self, byte: T) -> Result<(), Error> {
        if self.is_full() {
            return Err(Error::FullBuffer)
        }

        self.buffer[self.next] = Some(byte);
        self.next = (self.next + 1) % self.buffer.len();
        self.size += 1;
        Ok(())
    }

    pub fn clear(&mut self) {
        self.buffer.iter_mut().for_each(|slot| *slot = None);
        self.size = 0;
        self.next = 0;
    }

    pub fn is_empty(&self) -> bool {
        self.size == 0
    }

    pub fn is_full(&self) -> bool {
        self.size == self.buffer.len()
    }
}
