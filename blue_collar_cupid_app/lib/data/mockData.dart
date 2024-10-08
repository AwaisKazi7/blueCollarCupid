import 'package:blue_collar_cupid_app/MVC/model/cardModel.dart';
import 'package:blue_collar_cupid_app/MVC/model/messageModel.dart';

class MockData {
  static List<MessageModel> dummyMassages = [
    MessageModel(
      id: 1,
      messageType: MessageType.text,
      content: "Hello, how are you?",
      userId: 1,
      Sendertype: 'sender',
      date: DateTime.now(),
    ),
    MessageModel(
      id: 2,
      messageType: MessageType.text,
      content: "I'm doing great! How about you?",
      userId: 2,
      Sendertype: 'reciver',
      date: DateTime.now().add(Duration(minutes: 5)),
    ),
    MessageModel(
      id: 3,
      messageType: MessageType.image,
      content: "Check out this image!",
      media: "https://example.com/image.jpg",
      userId: 1,
      Sendertype: 'sender',
      date: DateTime.now().add(Duration(minutes: 10)),
    ),
    MessageModel(
      id: 4,
      messageType: MessageType.video,
      content: "Watch this video!",
      media: "https://example.com/video.mp4",
      Sendertype: 'reciver',
      userId: 2,
      date: DateTime.now().add(Duration(minutes: 15)),
    ),
    MessageModel(
      id: 1,
      messageType: MessageType.text,
      content: "Hello, how are you?",
      userId: 1,
      Sendertype: 'sender',
      date: DateTime.now(),
    ),
    MessageModel(
      id: 2,
      messageType: MessageType.text,
      content: "I'm doing great! How about you?",
      userId: 2,
      Sendertype: 'reciver',
      date: DateTime.now().add(Duration(minutes: 5)),
    ),
    MessageModel(
      id: 3,
      messageType: MessageType.image,
      content: "Check out this image!",
      media: "https://example.com/image.jpg",
      userId: 1,
      Sendertype: 'sender',
      date: DateTime.now().add(Duration(minutes: 10)),
    ),
    MessageModel(
      id: 4,
      messageType: MessageType.video,
      content: "Watch this video!",
      media: "https://example.com/video.mp4",
      Sendertype: 'reciver',
      userId: 2,
      date: DateTime.now().add(Duration(minutes: 15)),
    ),
    MessageModel(
      id: 1,
      messageType: MessageType.text,
      content: "Hello, how are you?",
      userId: 1,
      Sendertype: 'sender',
      date: DateTime.now(),
    ),
    MessageModel(
      id: 2,
      messageType: MessageType.text,
      content: "I'm doing great! How about you?",
      userId: 2,
      Sendertype: 'reciver',
      date: DateTime.now().add(Duration(minutes: 5)),
    ),
    MessageModel(
      id: 3,
      messageType: MessageType.image,
      content: "Check out this image!",
      media: "https://example.com/image.jpg",
      userId: 1,
      Sendertype: 'sender',
      date: DateTime.now().add(Duration(minutes: 10)),
    ),
    MessageModel(
      id: 4,
      messageType: MessageType.video,
      content: "Watch this video!",
      media: "https://example.com/video.mp4",
      Sendertype: 'reciver',
      userId: 2,
      date: DateTime.now().add(Duration(minutes: 15)),
    ),
    // Add more dummy messages as needed
  ];

  static List<MatchCard> matchCards = [
    MatchCard(
      name: "John Doe",
      picture: "https://e1.pxfuel.com/desktop-wallpaper/427/494/desktop-wallpaper-jade-weber-posted-by-samantha-peltier-jade-weber.jpg",
      address: "1234 Elm Street, Springfield",
    ),
    MatchCard(
      name: "Jane Smith",
      picture: "https://e1.pxfuel.com/desktop-wallpaper/767/795/desktop-wallpaper-anna-von-klinski.jpg",
      address: "5678 Oak Avenue, Rivertown",
    ),
    MatchCard(
      name: "Camila Alvarez",
      picture: "https://www.stylecraze.com/wp-content/uploads/2013/06/Different-Beautiful-American-Girls.jpg",
      address: "9876 Pine Blvd, Smalltown",
    ),
    MatchCard(
      name: "Bob Brown",
      picture: "https://e1.pxfuel.com/desktop-wallpaper/682/554/desktop-wallpaper-दुनिया-की-सबसे-सुन्दर-लड़कियों-की-इमेज-डाउनलोड-most-beautiful-girl-for-mobile-phone-usa-girls-thumbnail.jpg",
      address: "4321 Maple Road, Lakeview",
    ),
    MatchCard(
      name: "Jane Smith",
      picture: "https://e1.pxfuel.com/desktop-wallpaper/951/841/desktop-wallpaper-nazia-hussain-on-face-color-in-2020-thumbnail.jpg",
      address: "5678 Oak Avenue, Rivertown",
    ),
    MatchCard(
      name: "Camila Alvarez",
      picture: "https://e0.pxfuel.com/wallpapers/97/466/desktop-wallpaper-amanda-seyfried-eye-hollywood-actress.jpg",
      address: "9876 Pine Blvd, Smalltown",
    ),
    MatchCard(
      name: "Bob Brown",
      picture: "https://e1.pxfuel.com/desktop-wallpaper/682/554/desktop-wallpaper-दुनिया-की-सबसे-सुन्दर-लड़कियों-की-इमेज-डाउनलोड-most-beautiful-girl-for-mobile-phone-usa-girls-thumbnail.jpg",
      address: "4321 Maple Road, Lakeview",
    ),
  ];
}
