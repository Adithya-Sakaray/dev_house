import 'package:dev_house/Backend_services/jobs_manager.dart';
import 'package:get/get.dart';


class JobController extends GetxController {
  RxList jobsList = [].obs;

  @override
  void onInit() {
    super.onInit();
    print("Job Controller Init called");
    fetchJobs();
  }

  Future<void> fetchJobs() async {
    try {
      final List<dynamic> myList1 = await JobsManager.fetchJobs();
      jobsList.assignAll(myList1);
    }
    catch (e) {
      print("Error occured in controller fetch student jobs $e");
    }
  }
}