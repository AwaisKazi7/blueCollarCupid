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
      id: 1,
      name: "John Doe",
      picture: [
        "https://d1fufvy4xao6k9.cloudfront.net/images/blog/posts/2023/08/hockerty_business_casual_outfits_for_woman_013a099b_0b8b_43a2_886f_754716f88f1a.jpg",
        "https://static.vecteezy.com/system/resources/previews/035/804/667/non_2x/ai-generated-korean-girl-in-a-black-blazer-and-a-white-shirt-standing-against-a-office-free-photo.jpg",
        "https://i.pinimg.com/736x/ee/8e/44/ee8e449f4612091d5533db3879404898.jpg",
        "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjq7ahnmPrvK_0LxNW4J1UJrdEQHCS4U-kv0wC3Fluf583kP7vpsQgcP0szbXRYppe0VlEmhr09sSWqc_4cJL1Rj09Mt7yJTsNI_Zc9dyHVF7gamPfzZYPFSWinTj2GFqPeZg8yUSibVZ40_LYl8qi0JhLmMsDRNO3013qZ-oNzfCKFOf3NoRCvkYDhvw/s1200/what-is-clean-girl-aestheticby-lizbreygel-thumbnail-6.JPG"
      ],
      address: "1234 Elm Street, Springfield",
    ),
    MatchCard(
      id: 12,
      name: "Paul Daniel",
      picture: [
        "https://i.pinimg.com/originals/e3/00/bc/e300bca18a3c413710832ee510b2bf2c.png",
        "https://lostnloveco.com/wp-content/uploads/2023/10/image-55.webp?ezimgfmt=rs:372x558/rscb1/ng:webp/ngcb1",
        "https://images.lifestyleasia.com/wp-content/uploads/sites/7/2020/04/03165456/DPqDE1sWkAANTi1.jpg",
      ],
      address: "4321 Maple Road, Lakeview",
    ),
    MatchCard(
      id: 2,
      name: "Emily Johnson",
      picture: [
        "https://www.kopykitab.com/blog/wp-content/uploads/2022/03/Top-10-Best-Career-Options-For-Women-And-Girls-In-India.jpg",
        "https://static.vecteezy.com/system/resources/previews/035/804/667/non_2x/ai-generated-korean-girl-in-a-black-blazer-and-a-white-shirt-standing-against-a-office-free-photo.jpg",
        "https://i.pinimg.com/736x/ee/8e/44/ee8e449f4612091d5533db3879404898.jpg",
        "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjq7ahnmPrvK_0LxNW4J1UJrdEQHCS4U-kv0wC3Fluf583kP7vpsQgcP0szbXRYppe0VlEmhr09sSWqc_4cJL1Rj09Mt7yJTsNI_Zc9dyHVF7gamPfzZYPFSWinTj2GFqPeZg8yUSibVZ40_LYl8qi0JhLmMsDRNO3013qZ-oNzfCKFOf3NoRCvkYDhvw/s1200/what-is-clean-girl-aestheticby-lizbreygel-thumbnail-6.JPG"
      ],
      address: "5678 Oak Avenue, Rivertown",
    ),
    MatchCard(
      id: 13,
      name: "Paul Alvarez",
      picture: [
        "https://images.lifestyleasia.com/wp-content/uploads/sites/7/2020/04/03165456/DPqDE1sWkAANTi1.jpg",
        "https://i.pinimg.com/originals/e3/00/bc/e300bca18a3c413710832ee510b2bf2c.png",
        "https://lostnloveco.com/wp-content/uploads/2023/10/image-55.webp?ezimgfmt=rs:372x558/rscb1/ng:webp/ngcb1",
      ],
      address: "4321 Maple Road, Lakeview",
    ),
    MatchCard(
      id: 11,
      name: "Daniel Paul",
      picture: [
        "https://lostnloveco.com/wp-content/uploads/2023/10/image-55.webp?ezimgfmt=rs:372x558/rscb1/ng:webp/ngcb1",
        "https://i.pinimg.com/originals/e3/00/bc/e300bca18a3c413710832ee510b2bf2c.png",
        "https://images.lifestyleasia.com/wp-content/uploads/sites/7/2020/04/03165456/DPqDE1sWkAANTi1.jpg",
      ],
      address: "4321 Maple Road, Lakeview",
    ),
    MatchCard(
      id: 3,
      name: "Camila Alvarez",
      picture: [
        "https://img.freepik.com/premium-photo/realistic-photo-professional-woman-elegant-professional-outfit-very-pretty_1089234-16901.jpg",
        "https://static.vecteezy.com/system/resources/previews/035/804/667/non_2x/ai-generated-korean-girl-in-a-black-blazer-and-a-white-shirt-standing-against-a-office-free-photo.jpg",
        "https://i.pinimg.com/736x/ee/8e/44/ee8e449f4612091d5533db3879404898.jpg",
        "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjq7ahnmPrvK_0LxNW4J1UJrdEQHCS4U-kv0wC3Fluf583kP7vpsQgcP0szbXRYppe0VlEmhr09sSWqc_4cJL1Rj09Mt7yJTsNI_Zc9dyHVF7gamPfzZYPFSWinTj2GFqPeZg8yUSibVZ40_LYl8qi0JhLmMsDRNO3013qZ-oNzfCKFOf3NoRCvkYDhvw/s1200/what-is-clean-girl-aestheticby-lizbreygel-thumbnail-6.JPG"
      ],
      address: "9876 Pine Blvd, Smalltown",
    ),
    MatchCard(
      id: 4,
      name: "Mark Anderson",
      picture: [
        "https://img.freepik.com/free-photo/brunette-business-woman-with-wavy-long-hair-blue-eyes-stands-holding-notebook-hands_197531-343.jpg",
        "https://static.vecteezy.com/system/resources/previews/035/804/667/non_2x/ai-generated-korean-girl-in-a-black-blazer-and-a-white-shirt-standing-against-a-office-free-photo.jpg",
        "https://i.pinimg.com/736x/ee/8e/44/ee8e449f4612091d5533db3879404898.jpg",
        "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjq7ahnmPrvK_0LxNW4J1UJrdEQHCS4U-kv0wC3Fluf583kP7vpsQgcP0szbXRYppe0VlEmhr09sSWqc_4cJL1Rj09Mt7yJTsNI_Zc9dyHVF7gamPfzZYPFSWinTj2GFqPeZg8yUSibVZ40_LYl8qi0JhLmMsDRNO3013qZ-oNzfCKFOf3NoRCvkYDhvw/s1200/what-is-clean-girl-aestheticby-lizbreygel-thumbnail-6.JPG"
      ],
      address: "4321 Maple Road, Lakeview",
    ),
    MatchCard(
      id: 5,
      name: "Sophia Lee",
      picture: [
        "https://e1.pxfuel.com/desktop-wallpaper/951/841/desktop-wallpaper-nazia-hussain-on-face-color-in-2020-thumbnail.jpg",
        "https://static.vecteezy.com/system/resources/previews/035/804/667/non_2x/ai-generated-korean-girl-in-a-black-blazer-and-a-white-shirt-standing-against-a-office-free-photo.jpg",
        "https://i.pinimg.com/736x/ee/8e/44/ee8e449f4612091d5533db3879404898.jpg",
        "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjq7ahnmPrvK_0LxNW4J1UJrdEQHCS4U-kv0wC3Fluf583kP7vpsQgcP0szbXRYppe0VlEmhr09sSWqc_4cJL1Rj09Mt7yJTsNI_Zc9dyHVF7gamPfzZYPFSWinTj2GFqPeZg8yUSibVZ40_LYl8qi0JhLmMsDRNO3013qZ-oNzfCKFOf3NoRCvkYDhvw/s1200/what-is-clean-girl-aestheticby-lizbreygel-thumbnail-6.JPG"
      ],
      address: "5678 Oak Avenue, Rivertown",
    ),
    MatchCard(
      id: 6,
      name: "Isabella Garcia",
      picture: [
        "https://e0.pxfuel.com/wallpapers/97/466/desktop-wallpaper-amanda-seyfried-eye-hollywood-actress.jpg",
        "https://static.vecteezy.com/system/resources/previews/035/804/667/non_2x/ai-generated-korean-girl-in-a-black-blazer-and-a-white-shirt-standing-against-a-office-free-photo.jpg",
        "https://i.pinimg.com/736x/ee/8e/44/ee8e449f4612091d5533db3879404898.jpg",
        "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjq7ahnmPrvK_0LxNW4J1UJrdEQHCS4U-kv0wC3Fluf583kP7vpsQgcP0szbXRYppe0VlEmhr09sSWqc_4cJL1Rj09Mt7yJTsNI_Zc9dyHVF7gamPfzZYPFSWinTj2GFqPeZg8yUSibVZ40_LYl8qi0JhLmMsDRNO3013qZ-oNzfCKFOf3NoRCvkYDhvw/s1200/what-is-clean-girl-aestheticby-lizbreygel-thumbnail-6.JPG"
      ],
      address: "9876 Pine Blvd, Smalltown",
    ),
    MatchCard(
      id: 7,
      name: "Liam Martinez",
      picture: [
        "https://img.freepik.com/free-photo/brunette-business-woman-with-wavy-long-hair-blue-eyes-stands-holding-notebook-hands_197531-343.jpg",
        "https://static.vecteezy.com/system/resources/previews/035/804/667/non_2x/ai-generated-korean-girl-in-a-black-blazer-and-a-white-shirt-standing-against-a-office-free-photo.jpg",
        "https://i.pinimg.com/736x/ee/8e/44/ee8e449f4612091d5533db3879404898.jpg",
        "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjq7ahnmPrvK_0LxNW4J1UJrdEQHCS4U-kv0wC3Fluf583kP7vpsQgcP0szbXRYppe0VlEmhr09sSWqc_4cJL1Rj09Mt7yJTsNI_Zc9dyHVF7gamPfzZYPFSWinTj2GFqPeZg8yUSibVZ40_LYl8qi0JhLmMsDRNO3013qZ-oNzfCKFOf3NoRCvkYDhvw/s1200/what-is-clean-girl-aestheticby-lizbreygel-thumbnail-6.JPG"
      ],
      address: "4321 Maple Road, Lakeview",
    ),
    MatchCard(
      id: 8,
      name: "Grace Taylor",
      picture: [
        "https://static.vecteezy.com/system/resources/previews/035/804/667/non_2x/ai-generated-korean-girl-in-a-black-blazer-and-a-white-shirt-standing-against-a-office-free-photo.jpg",
        "https://img.freepik.com/free-photo/brunette-business-woman-with-wavy-long-hair-blue-eyes-stands-holding-notebook-hands_197531-343.jpg",
        "https://i.pinimg.com/736x/ee/8e/44/ee8e449f4612091d5533db3879404898.jpg",
        "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjq7ahnmPrvK_0LxNW4J1UJrdEQHCS4U-kv0wC3Fluf583kP7vpsQgcP0szbXRYppe0VlEmhr09sSWqc_4cJL1Rj09Mt7yJTsNI_Zc9dyHVF7gamPfzZYPFSWinTj2GFqPeZg8yUSibVZ40_LYl8qi0JhLmMsDRNO3013qZ-oNzfCKFOf3NoRCvkYDhvw/s1200/what-is-clean-girl-aestheticby-lizbreygel-thumbnail-6.JPG"
      ],
      address: "4321 Maple Road, Lakeview",
    ),
    MatchCard(
      id: 9,
      name: "Lucas Wilson",
      picture: [
        "https://i.pinimg.com/736x/ee/8e/44/ee8e449f4612091d5533db3879404898.jpg",
        "https://static.vecteezy.com/system/resources/previews/035/804/667/non_2x/ai-generated-korean-girl-in-a-black-blazer-and-a-white-shirt-standing-against-a-office-free-photo.jpg",
        "https://img.freepik.com/free-photo/brunette-business-woman-with-wavy-long-hair-blue-eyes-stands-holding-notebook-hands_197531-343.jpg",
        "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjq7ahnmPrvK_0LxNW4J1UJrdEQHCS4U-kv0wC3Fluf583kP7vpsQgcP0szbXRYppe0VlEmhr09sSWqc_4cJL1Rj09Mt7yJTsNI_Zc9dyHVF7gamPfzZYPFSWinTj2GFqPeZg8yUSibVZ40_LYl8qi0JhLmMsDRNO3013qZ-oNzfCKFOf3NoRCvkYDhvw/s1200/what-is-clean-girl-aestheticby-lizbreygel-thumbnail-6.JPG"
      ],
      address: "4321 Maple Road, Lakeview",
    ),
    MatchCard(
      id: 10,
      name: "Daniel Thomas",
      picture: [
        "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjq7ahnmPrvK_0LxNW4J1UJrdEQHCS4U-kv0wC3Fluf583kP7vpsQgcP0szbXRYppe0VlEmhr09sSWqc_4cJL1Rj09Mt7yJTsNI_Zc9dyHVF7gamPfzZYPFSWinTj2GFqPeZg8yUSibVZ40_LYl8qi0JhLmMsDRNO3013qZ-oNzfCKFOf3NoRCvkYDhvw/s1200/what-is-clean-girl-aestheticby-lizbreygel-thumbnail-6.JPG",
        "https://i.pinimg.com/736x/ee/8e/44/ee8e449f4612091d5533db3879404898.jpg",
        "https://static.vecteezy.com/system/resources/previews/035/804/667/non_2x/ai-generated-korean-girl-in-a-black-blazer-and-a-white-shirt-standing-against-a-office-free-photo.jpg",
        "https://img.freepik.com/free-photo/brunette-business-woman-with-wavy-long-hair-blue-eyes-stands-holding-notebook-hands_197531-343.jpg"
      ],
      address: "4321 Maple Road, Lakeview",
    ),
  ];
}
