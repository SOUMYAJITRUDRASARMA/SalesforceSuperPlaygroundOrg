public class BusScheduleCache {
    // Private variable for org cache partition
    private Cache.OrgPartition part;
    
    // Constructor: initializes the partition
    public BusScheduleCache() {
        // Assign partition object to 'part' variable
        part = Cache.Org.getPartition('local.BusSchedule');
    }
    
    // Method to store bus schedule in the cache
    public void putSchedule(String busLine, Time[] schedule) {
        // Put the bus schedule in the org cache
        part.put(busLine, schedule);
    }
    
    // Method to retrieve bus schedule from the cache
    public Time[] getSchedule(String busLine) {
        // Retrieve the schedule from the cache
        Time[] schedule = (Time[]) part.get(busLine);
        
        // Handle cache miss (null value returned)
        if (schedule == null) {
            // Return default schedule (8am and 5pm)
            return new Time[]{
                Time.newInstance(8, 0, 0, 0),  // 8:00 AM
                Time.newInstance(17, 0, 0, 0)  // 5:00 PM
            };
        }
        
        // Return the cached schedule if found
        return schedule;
    }
}