import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled_localization/cubit/lang_cubit.dart';

import 'cubit/lang_state.dart';
import 'generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LangCubit, LangState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).title),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.language,
                  size: 30,
                ),
                onPressed: () {
                  LangCubit.get(context).changeLang();
                },
              ),
              IconButton(
                icon: Icon(
                  LangCubit.get(context).isDark?Icons.dark_mode:Icons.light_mode,
                  size: 30,
                ),
                onPressed: () {
                   LangCubit.get(context).changeMode();
                },
              )
            ],
          ),
          body: Row(
            children: [
              const SizedBox(
                width: 50,
              ),
              Center(child: Text(S.current.localization,
                  style:Theme.of(context).textTheme.bodyLarge
              )),
              const SizedBox(
                width: 50,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right:LangCubit.get(context). checkArabic() ? 0 : 16.0,
                    left: LangCubit.get(context). checkArabic() ? 16 : 0),
                child: Text(S.of(context).hello,
                    style:Theme.of(context).textTheme.bodyLarge),
              ),
              Text(S.of(context).name,
                  style:Theme.of(context).textTheme.bodyLarge
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(

            currentIndex: 0,
            onTap: (index) {
              // cubit.changeCurrentIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.business,),
                label: 'Business',

              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports,),
                label: 'Sports',

              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.science_outlined,),
                label: 'Science',

              ),

            ],
          ),
        );
      },
    );
  }
}
