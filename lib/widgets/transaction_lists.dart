import 'package:flutter/material.dart';

import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  const TransactionList(this.transactions, this.deleteTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constrains) {
            return Column(
              children: [
                Text(
                  'No transaction added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: constrains.maxHeight * .6,
                  child: Image.asset('assets/images/waiting.png'),
                )
              ],
            );
          })
        : ListView(
            children: transactions
                .map((e) => TransactionItem(
                      key: ValueKey(e.id),
                      transaction: e,
                      deleteTransaction: deleteTransaction,
                    ))
                .toList());
  }
}
