import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../models/player_model.dart';
import '../utils/constants.dart';
import '../viewmodels/game_viewmodel.dart';

class GameScreen extends StatelessWidget {
  static const String routeName = 'GameScreen';

  const GameScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as PlayerModel;
    return ChangeNotifierProvider(
      create: (context) => GameViewModel(isSinglePlayer: arg.isSinglePlayer),
      child: Consumer<GameViewModel>(
        builder: (context, gameViewModel, _) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppConstants.bgColor,
              leading: Padding(

                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 30.sp,
                  ),
                ),
              ),
            ),
            backgroundColor: AppConstants.bgColor,
            body: Padding(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              arg.playerOne,
                              style: AppConstants.customFontWhite,
                            ),
                            Text(
                              gameViewModel.xScore.toString(),
                              style: AppConstants.customFontWhite,
                            ),
                          ],
                        ),
                        SizedBox(width: 20.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              gameViewModel.isSinglePlayer
                                  ? 'AI'
                                  : arg.playerTwo,
                              style: AppConstants.customFontWhite,
                            ),
                            Text(
                              gameViewModel.oScore.toString(),
                              style: AppConstants.customFontWhite,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: GridView.builder(
                        itemCount: 9,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              gameViewModel.tapped(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.sp),
                                border: Border.all(
                                  width: 5.w,
                                  color: const Color(0xff271767),
                                ),
                                color: gameViewModel.winIndexes.contains(index)
                                    ? AppConstants.boxWinColor
                                    : AppConstants.boxColor,
                              ),
                              child: Center(
                                child: Text(
                                  gameViewModel.bordState[index],
                                  style: AppConstants.customFontWhite
                                      .copyWith(fontSize: 64.sp),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(gameViewModel.resultDeclaration,
                              style: AppConstants.customFontWhite),
                          SizedBox(height: 10.h),
                          Visibility(
                            visible: !gameViewModel.isOn,
                            child: IconButton(
                              onPressed: () {
                                gameViewModel.clearBoard();
                              },
                              icon: Icon(
                                Icons.restart_alt,
                                color: Colors.white,
                                size: 35.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
