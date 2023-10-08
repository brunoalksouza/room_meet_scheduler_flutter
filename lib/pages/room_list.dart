import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:room_meet_scheduler_flutter/pages/scheduler.dart';

class RoomListPage extends StatelessWidget {
  const RoomListPage({required this.token, Key? key}) : super(key: key);
  final token;

  @override
  Widget build(BuildContext context) {
    String? titleRoom = 'Zebra';

    return Scaffold(
      body: SafeArea(
        top: true,
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Align(
              alignment: const AlignmentDirectional(0.00, 0.00),
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titleRoom,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Divider(
                        height: 24,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              DateFormat("EEEE, d 'de' MMMM", 'pt_BR')
                                  .format(
                                    DateTime.now(),
                                  )
                                  .toString(),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Scheduler(
                                      titleRoom: titleRoom,
                                    ),
                                  ),
                                );
                              },
                              child: const Text('Agendar'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
