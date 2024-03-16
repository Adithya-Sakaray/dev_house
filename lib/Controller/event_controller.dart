import 'package:dev_house/Backend_services/event_manager.dart';
import 'package:dev_house/Backend_services/jobs_manager.dart';
import 'package:get/get.dart';


class EventController extends GetxController {
  RxList eventList = [].obs;

  @override
  void onInit() {
    super.onInit();
    print("Event Controller Init called");
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    try {
      final List<dynamic> myList1 = await EventManager.fetchEvents();
      eventList.assignAll(myList1);
    }
    catch (e) {
      print("Error occured in controller fetch student events $e");
    }
  }
}