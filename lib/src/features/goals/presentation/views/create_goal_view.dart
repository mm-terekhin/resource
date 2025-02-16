import 'package:flutter/material.dart';
import '../../../../../app/app.dart';
import '../../../../../app/i18n/translations.g.dart';
import '../../../../shared/shared.dart';

class CreateGoalView extends StatelessWidget {
  const CreateGoalView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: theme.palette.buttonPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              theme.radii.x10,
            ),
          ),
          onPressed: () {},
          label: Text(
            i18n.buttonTitle.save,
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(
            theme.spacings.x4,
          ),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            TextField(
              style: theme.textTheme.titleMedium,
              maxLines: null,
              maxLength: 1000,
              onChanged: (value) {},
              decoration: InputDecoration(
                counter: Container(),
                hintStyle: theme.textTheme.titleMedium?.copyWith(
                  color: theme.palette.textSecondary,
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: i18n.textFieldLabel.title,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: theme.spacings.x6,
              ),
              child: TextField(
                style: theme.textTheme.bodyLarge,
                maxLines: null,
                maxLength: 1000,
                onChanged: (value) {},
                decoration: InputDecoration(
                  counter: Container(),
                  hintStyle: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.palette.textSecondary,
                  ),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintText: i18n.textFieldLabel.smallTaskAdd,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: theme.spacings.x5,
              ),
              child: ExpandingTextField(
                hintText: i18n.textFieldLabel.comment,
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              height: theme.spacings.x2,
            ),
            Row(
              children: [
                Text(
                  i18n.shared.priority,
                ),
                SizedBox(
                  width: theme.spacings.x3,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        theme.palette.buttonPrimary.withOpacity(
                          0.5,
                        ),
                      ),
                    ),
                    onPressed: () => _showPriorityModal(context),
                    child: Text(
                      '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  i18n.shared.termUp,
                ),
                SizedBox(
                  width: theme.spacings.x3,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        theme.palette.buttonPrimary.withOpacity(
                          0.5,
                        ),
                      ),
                    ),
                    onPressed: () {
                      //TODO: -show date picker
                    },
                    child: Text(
                      '',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showPriorityModal(BuildContext context) async {
    //TODO: -show modal
  }
}
