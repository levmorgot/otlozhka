import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_category_entity.dart';
import 'package:otlozhka/features/transactions/domain/entities/transaction_entity.dart';

class AnimatedChartWidget extends StatefulWidget {
  final Iterable<TransactionCategory> periodCategories;
  final List<Transaction> transactions;
  final double transactionsAmount;
  final ScrollController scrollController;

  const AnimatedChartWidget({super.key, required this.periodCategories, required this.transactions, required this.transactionsAmount, required this.scrollController});

  @override
  State<AnimatedChartWidget> createState() => _AnimatedChartWidgetState();
}

class _AnimatedChartWidgetState extends State<AnimatedChartWidget> {
  late Widget _child;
  double oldPixels = 0;
  bool isFullChart = true;

  @override
  void initState() {
    _child = _PieChartWidget(
      periodCategories: widget.periodCategories,
      transactions: widget.transactions,
      transactionsAmount: widget.transactionsAmount,
    );
    super.initState();
  }

  void setupScrollController(BuildContext context) {
    widget.scrollController.addListener(
      () {
        if (isFullChart && widget.scrollController.position.pixels > oldPixels) {
          _child = _BarChartWidget(
            periodCategories: widget.periodCategories,
            transactions: widget.transactions,
            transactionsAmount: widget.transactionsAmount,
          );
          isFullChart = false;
          oldPixels = widget.scrollController.position.pixels;
          setState(() {});
        } else if (!isFullChart && widget.scrollController.position.pixels < oldPixels) {
          _child = _PieChartWidget(
            periodCategories: widget.periodCategories,
            transactions: widget.transactions,
            transactionsAmount: widget.transactionsAmount,
          );
          isFullChart = true;
          oldPixels = widget.scrollController.position.pixels;
          setState(() {});
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    return Column(
      children: [
        AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: _child),
      ],
    );
  }
}

class _PieChartWidget extends StatelessWidget {
  final Iterable<TransactionCategory> periodCategories;
  final List<Transaction> transactions;
  final double transactionsAmount;

  const _PieChartWidget({required this.periodCategories, required this.transactions, required this.transactionsAmount});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sections: periodCategories.isNotEmpty
                  ? periodCategories.map(
                      (category) {
                        double amount = 0;
                        for (var transaction in transactions) {
                          if (transaction.categoryId == category.id) {
                            amount += transaction.amount;
                          }
                        }
                        return PieChartSectionData(
                          radius: 30,
                          title: '',
                          color: category.color,
                          value: amount,
                        );
                      },
                    ).toList()
                  : [
                      PieChartSectionData(
                        radius: 25,
                        title: '',
                        color: Colors.grey,
                        value: 100,
                      ),
                    ],
            ),
            swapAnimationDuration: const Duration(milliseconds: 200), // Optional
            swapAnimationCurve: Curves.ease, // Optional
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 150,
              child: Center(
                child: Text(
                  transactions.isNotEmpty ? '${transactionsAmount.round()} ₽' : 'Нет операций за выбранный период',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BarChartWidget extends StatelessWidget {
  final Iterable<TransactionCategory> periodCategories;
  final List<Transaction> transactions;
  final double transactionsAmount;

  const _BarChartWidget({required this.periodCategories, required this.transactions, required this.transactionsAmount});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Column(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: periodCategories.isNotEmpty
                    ? periodCategories.map(
                        (category) {
                          double amount = 0;

                          for (var transaction in transactions) {
                            if (transaction.categoryId == category.id) {
                              amount += transaction.amount;
                            }
                          }
                          return SizedBox(
                            width: (MediaQuery.of(context).size.width - 34) * (amount / transactionsAmount),
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: category.color),
                              child: const Text(''),
                            ),
                          );
                        },
                      ).toList()
                    : [
                        const Text('sd'),
                      ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 150,
            child: Center(
              child: Text(
                transactions.isNotEmpty ? '${transactionsAmount.round()} ₽' : 'Нет операций за выбранный период',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
