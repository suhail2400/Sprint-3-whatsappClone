import 'package:whatsapp_clone/models/ChatModel.dart';
import 'package:whatsapp_clone/models/singleChatModel.dart';

List<Chat> chatList = [
  Chat(
      avatar: "",
      name: "CyberSquare flutter team",
      status: 'offline',
      isGroup: true,
      updatedAt: '3:00 pm',
      message: 'Hai'),
  Chat(
      avatar:
          'https://images.unsplash.com/photo-1682686578615-39549501dd08?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60',
      name: 'Jhon',
      status: 'online',
      isGroup: false,
      updatedAt: '9:00 pm',
      message: 'Hello'),
  Chat(
      avatar: '',
      name: 'Raju',
      status: 'offline',
      isGroup: false,
      updatedAt: '9:00 pm',
      message: 'Hello'),
  Chat(
      avatar:
          'https://images.unsplash.com/photo-1693346223929-17afbce70514?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80',
      name: 'Family',
      status: 'offline',
      isGroup: true,
      updatedAt: '7:00 am',
      message: 'Good Morning')
];

List<SingleChat> messageList = [
  SingleChat(
      isSend: true, isReaded: true, message: 'Hi all', sendAt: '9:00 am'),
  SingleChat(isSend: false, isReaded: false, message: 'Hi ', sendAt: '9:00 am'),
  SingleChat(isSend: true, isReaded: false, message: 'Hi ', sendAt: '9:00 am'),
];
