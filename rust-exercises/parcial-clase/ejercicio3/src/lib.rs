struct Point (f64, f64);

pub trait Shape {
    fn area(&self) -> f64;
    fn container_box(&self, center: &Point) -> (Point, Point);
}


struct Circle{
    r: f64
}

impl Circle{
    pub fn new(r: f64) -> Box<dyn Shape> {
        Box::new(Circle{r})
    }
}

impl Shape for Circle {
    fn area(&self) -> f64 {
        self.r * self.r * 3.14
    }

    fn container_box(&self, center: &Point) -> (Point, Point) {
        (Point(center.0 - self.r, center.1 - self.r), Point(center.0 + self.r, center.1 + self.r))
    }
}


struct Rectangle{
    width: f64,
    height: f64
}

impl Rectangle {
    pub fn new (width: f64, height: f64) -> Box<dyn Shape> {
        Box::new(Rectangle{width, height})
    }
}

impl Shape for Rectangle {
    fn area (&self) -> f64 {
        self.height * self.width
    }

    fn container_box(&self, center: &Point) -> (Point, Point) {
        (Point(center.0 - self.width / 2.0, center.1 - self.height / 2.0), Point(center.0 + self.width / 2.0, center.1 + self.height / 2.0))
    }
}


struct Canvas {
    width: f64,
    height: f64,
    shapes: Vec<(Point, Box<dyn Shape>)>
}

impl Canvas {
    pub fn new(width: f64, height: f64) -> Self {
        Self {width, height, shapes: Vec::new()}
    }

    pub fn add(&mut self, place: Point, shape: Box<dyn Shape>){
        let (p1, p2) = shape.container_box(&place);
        if p1.0 >= 0.0 && p1.1 >= 0.0 && p2.0 <= self.width && p2.1 <= self.height {
            self.shapes.push((place, shape))
        }
    }

    pub fn sum_areas(&self) -> f64 {
        let mut area = 0.0;
        for (_, shape) in &self.shapes {
            area += shape.area();
        }

        area
    }

    pub fn shift_all(&mut self, shift_x: f64, shift_y: f64) -> bool {
        for (point, shape) in &self.shapes{
            let (p1, p2) = shape.container_box(point);

            if p1.0+shift_x <= 0.0 || p1.1+shift_y <= 0.0 || p2.0+shift_x >= self.width || p2.1+shift_y >= self.height {
                return false
            }
        }

        for (point, _) in &mut self.shapes{
            point.0 += shift_x;
            point.1 += shift_y;
        }

        true
    }
}



fn main() {

}