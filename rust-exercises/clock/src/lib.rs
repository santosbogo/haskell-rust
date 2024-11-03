use std::fmt;

#[derive(PartialEq, Debug)]
pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let total_minutes = hours * 60 + minutes;
        Self::from_minutes(total_minutes)
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let total_minutes = self.hours * 60 + self.minutes + minutes;
        Self::from_minutes(total_minutes)
    }

    fn from_minutes(total_minutes: i32) -> Self {
        let mut minutes = total_minutes % 1440; // 1440 is the number of minutes in a day (24*60)
        if minutes < 0 {
            minutes += 1440; // Ensure time wraps around correctly if negative
        }
        let hours = minutes / 60;
        let minutes = minutes % 60;
        Self { hours, minutes }
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}