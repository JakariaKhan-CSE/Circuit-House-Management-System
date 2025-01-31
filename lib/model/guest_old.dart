// Mock Guest data model
class GuestOld {
  final String name;
  final String room;
  final String checkInDate;
  final String checkOutDate;
  final String purposeVising;
  // final String moreInfo;

  GuestOld(this.checkOutDate, this.purposeVising, {required this.name, required this.room, required this.checkInDate});
}
List<GuestOld> guestList = [
  GuestOld(
    "25-12-2024",
    "Business Meeting",
    name: "John Doe",
    room: "101",
    checkInDate: "20-12-2024",
  ),
  GuestOld(
    "30-12-2024",
    "Government",
    name: "Jane Smith",
    room: "102",
    checkInDate: "23-12-2024",
  ),
  GuestOld(
    "30-12-2024",
    "Government",
    name: "Jane",
    room: "102",
    checkInDate: "23-12-2024",
  ),
  GuestOld(
    "30-12-2024",
    "Vacation",
    name: "Smith",
    room: "102",
    checkInDate: "23-12-2024",
  ),
  GuestOld(
    "01-01-2025",
    "Conference",
    name: "Alice Brown",
    room: "103",
    checkInDate: "28-12-2024",
  ),
  GuestOld(
    "20-12-2024",
    "Workshop",
    name: "Bob Johnson",
    room: "104",
    checkInDate: "15-12-2024",
  ),
  GuestOld(
    "22-12-2024",
    "Wedding",
    name: "Emily Davis",
    room: "105",
    checkInDate: "18-12-2024",
  ),
  GuestOld(
    "26-12-2024",
    "Family Visit",
    name: "Michael Wilson",
    room: "106",
    checkInDate: "22-12-2024",
  ),
  GuestOld(
    "29-12-2024",
    "Holiday",
    name: "Sophia Martinez",
    room: "107",
    checkInDate: "24-12-2024",
  ),
  GuestOld(
    "02-01-2025",
    "Business Trip",
    name: "David Taylor",
    room: "108",
    checkInDate: "27-12-2024",
  ),
];