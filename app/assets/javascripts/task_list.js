
document.addEventListener('DOMContentLoaded', function() {
  // Get all clickable task elements
  var taskItems = document.querySelectorAll('.clickable-task');

  // Add click event listener to each task element
  taskItems.forEach(function(item) {
    item.addEventListener('click', function() {
      // Get the task ID from the element's ID attribute
      var taskId = item.id.split('_')[1];

      // Fetch task details by making an AJAX request (replace with your actual route)
      fetch('/tasks/' + taskId + 'js')
        .then(response => response.text())
        .then(data => {
          // Update the task-details-container with the fetched details
          document.getElementById('task-details-container').innerHTML = data;
        });
    });
  });
});
