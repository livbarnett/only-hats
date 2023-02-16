import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs
  static targets = [ "startDate", "endDate" ]

  connect() {
    flatpickr(this.startDateTarget, {
      altInput: true,
      // Set the minimum date to today
      minDate: "today",
      // When the user selects a date, set the minimum date of the end date to the selected date
      onChange: (selectedDates, dateStr, instance) => {
        this.endDateTarget._flatpickr.set("minDate", dateStr);
      },
      disable: ["2025-01-30", "2025-02-21", "2025-03-08", new Date(2025, 4, 9) ],
      dateFormat: "Y-m-d",
    })
    flatpickr(this.endDateTarget, {
      altInput: true,
      // Set the minimum date to the start date
      minDate: this.startDateTarget.value,
      // When the user selects a date, set the maximum date of the start date to the selected date
      onChange: (selectedDates, dateStr, instance) => {
        this.startDateTarget._flatpickr.set("maxDate", dateStr);
      }
    })
  }

}
