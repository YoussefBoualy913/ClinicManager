package clinicmanager.dto;

import java.time.LocalTime;

public class TimeSlotDTO {

    private LocalTime startTime;
    private LocalTime endTime;

    public TimeSlotDTO() {
    }

    public TimeSlotDTO(LocalTime startTime, LocalTime endTime) {
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public LocalTime getStartTime() {
        return startTime;
    }

    public LocalTime getEndTime() {
        return endTime;
    }

    public void setStartTime(LocalTime startTime) {
        this.startTime = startTime;
    }

    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
    }
}