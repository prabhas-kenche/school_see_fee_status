// main.dart
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'payment.dart';

class FeeStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Fee Status',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Class: 8',
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  FeeCard(
                    term: 'Term 1',
                    fee: 40000,
                    percentagePaid: 0.5,
                    endDate: '31-03-2025',
                    status: 'Completed',
                  ),
                  FeeCard(
                    term: 'Term 2',
                    fee: 25000,
                    percentagePaid: 0.3,
                    endDate: '30-06-2025',
                    status: 'Pending',
                  ),
                  FeeCard(
                    term: 'Term 3',
                    fee: 20000,
                    percentagePaid: 0.2,
                    endDate: '30-09-2025',
                    status: 'Over Due',
                  ),
                  FeeCard(
                    term: 'Exam Fee',
                    fee: 5000,
                    percentagePaid: 1.0,
                    endDate: '15-10-2025',
                    status: 'Pending',
                  ),
                  FeeCard(
                    term: 'Bus Fee',
                    fee: 20000,
                    percentagePaid: 1.0,
                    endDate: '15-10-2025',
                    status: 'Completed',
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(
                              term: 'All Terms',
                              fee: 50000,
                              endDate: '30-06-2025',
                              status: 'Pending',
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        backgroundColor: Colors.blueGrey,
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.3,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeeCard extends StatefulWidget {
  final String term;
  final int fee;
  final double percentagePaid;
  final String endDate;
  final String status;

  const FeeCard({
    required this.term,
    required this.fee,
    required this.percentagePaid,
    required this.endDate,
    required this.status,
  });

  @override
  _FeeCardState createState() => _FeeCardState();
}

class _FeeCardState extends State<FeeCard> {
  bool isSelected = false;

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  Color _getBackgroundColor() {
    switch (widget.status) {
      case 'Pending':
        return Colors.orangeAccent;
      case 'Completed':
        return Colors.green;
      case 'Over Due':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color _getTextColor() {
    return widget.status == 'Completed' ? Colors.white : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    bool isClickable = widget.status != 'Completed';
    Color cardColor = _getBackgroundColor();

    return GestureDetector(
      onTap: isClickable
          ? () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentPage(
              term: widget.term,
              fee: widget.fee,
              endDate: widget.endDate,
              status: widget.status,
            ),
          ),
        );
      }
          : null,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        margin: EdgeInsets.only(bottom: 16),
        child: Container(
          decoration: BoxDecoration(
            color: cardColor,
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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.term,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: _getTextColor(),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Fee: ₹${widget.fee}',
                          style: TextStyle(
                            fontSize: 16,
                            color: _getTextColor(),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'End Date: ${widget.endDate}',
                          style: TextStyle(
                            fontSize: 16,
                            color: _getTextColor(),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                          decoration: BoxDecoration(
                            color: widget.status == 'Completed' ? Colors.white : Colors.black,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            widget.status,
                            style: TextStyle(
                              color: widget.status == 'Completed' ? Colors.green : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        CircularPercentIndicator(
                          radius: 22.5,
                          lineWidth: 4.0,
                          percent: widget.percentagePaid,
                          center: Text(
                            '${(widget.percentagePaid * 100).toInt()}%',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          progressColor: Colors.white,
                          backgroundColor: Colors.black26,
                        ),
                      ],
                    ),
                  ],
                ),
                if (widget.status == 'Pending' || widget.status == 'Over Due')
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      width: 250,
                      height: 37,
                      child: ElevatedButton(
                        onPressed: toggleSelection,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: cardColor,// Matches card color for both Add and Remove
                          side: BorderSide(color: Colors.black, width: 0.7), // Black outline
                          elevation: 0,
                        ),
                        child: Text(
                          isSelected ? 'Remove' : 'Add',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
