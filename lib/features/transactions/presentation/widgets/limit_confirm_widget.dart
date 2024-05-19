import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LimitConfirmDialog {
  static void show(BuildContext context, Function() save) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {
                              AutoRouter.of(context).maybePop();
                            },
                            icon: const Icon(Icons.close)),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('Будет превышен месячный лимит по тратам в этой категории.\nЖелаете сохранить транцакцию?'),
                      ),
                      const Gap(30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                AutoRouter.of(context).maybePop();
                              },
                              child: const Text('Отмена'),
                            ),
                            TextButton(
                              onPressed: () {
                                AutoRouter.of(context).maybePop();
                                save();
                              },
                              child: const Text('Сохранить'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
              ),
            ));
  }
}
