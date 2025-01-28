import 'package:flutter/material.dart';

class FeeStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Fee Status',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Class: 8',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  FeeCard(
                    term: 'Term 1',
                    fee: 15000,
                    endDate: '2025-03-31',
                    status: 'Completed',
                  ),
                  FeeCard(
                    term: 'Term 2',
                    fee: 15000,
                    endDate: '2025-06-30',
                    status: 'Pending',
                  ),
                  FeeCard(
                    term: 'Term 3',
                    fee: 15000,
                    endDate: '2025-09-30',
                    status: 'Over Due',
                  ),
                  FeeCard(
                    term: 'Exam Fee',
                    fee: 5000,
                    endDate: '2025-10-15',
                    status: 'Pending',
                  ),
                  FeeCard(
                    term: 'Bus Fee',
                    fee: 20000,
                    endDate: '2025-10-15',
                    status: 'Pending',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle Fee Due action
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                backgroundColor: Colors.green,
              ),
              child: Text(
                'Pay',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeeCard extends StatelessWidget {
  final String term;
  final int fee;
  final String endDate;
  final String status;

  const FeeCard({
    required this.term,
    required this.fee,
    required this.endDate,
    required this.status,
  });

  Color _getBackgroundColor() {
    switch (status) {
      case 'Pending':
        return Colors.yellow;
      case 'Completed':
        return Colors.green;
      case 'Over Due':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color _getTextColor() {
    return status == 'Completed' ? Colors.white : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      margin: EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFD1D9E6).withOpacity(1),
              blurRadius: 30,
              offset: Offset(18, 18),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    term,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _getTextColor(),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Fee: ₹$fee',
                    style: TextStyle(
                      fontSize: 16,
                      color: _getTextColor(),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'End Date: $endDate',
                    style: TextStyle(
                      fontSize: 16,
                      color: _getTextColor(),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: status == 'Completed' ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: status == 'Completed' ? Colors.green : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
