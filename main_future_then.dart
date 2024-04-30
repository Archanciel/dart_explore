Future<String> fetchUsername() {
  // Simulating a network request with a delay
  return Future.delayed(Duration(seconds: 3), () {
    return "FutureUser123";
  });
}

void main() {
  print("Request started...");

  // Call fetchUsername, which returns a Future
  fetchUsername().then((String result) {
    // This block is executed when the future completes successfully
    print("Received result: $result");
  }).catchError((error) {
    // This block is executed if the future completes with an error
    print("An error occurred: $error");
  });

  print("Continuing other tasks...");
}
