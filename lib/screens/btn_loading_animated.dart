// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BtnLoadingAnimated extends StatelessWidget {
  const BtnLoadingAnimated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Buttom Animated Loading'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BtnLoadingCheckAnimated(),
          BtnLoadingNormal(),
        ],
      ),
    );
  }
}

enum ButtonState { init, loading, done }

class BtnLoadingCheckAnimated extends StatelessWidget {
  BtnLoadingCheckAnimated({Key? key}) : super(key: key);

  var state = ValueNotifier<ButtonState>(ButtonState.init);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ValueListenableBuilder(
      valueListenable: state,
      builder: (_, __, ___) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(80.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            width: state.value == ButtonState.init ? size.width : 70,
            height: 60,
            child: state.value == ButtonState.init
                ? loadingBtn()
                : buildCheckBtn(state.value),
          ),
        );
      },
    );
  }

  Widget loadingBtn() {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        side: MaterialStateProperty.all(const BorderSide(
          width: 2,
          color: Colors.indigo,
        )),
      ),
      child: const FittedBox(
        child: Text(
          'SUBMIT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w300,
            letterSpacing: 1.5,
          ),
        ),
      ),
      onPressed: () async {
        state.value = ButtonState.loading;
        await Future.delayed(const Duration(seconds: 3));
        state.value = ButtonState.done;
        await Future.delayed(const Duration(seconds: 3));
        state.value = ButtonState.init;
      },
    );
  }

  Widget buildCheckBtn(ButtonState state) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: state == ButtonState.done ? Colors.green : Colors.indigo,
      ),
      child: Center(
        child: state == ButtonState.done
            ? const Icon(Icons.done, size: 40, color: Colors.white)
            : const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}

class BtnLoadingNormal extends StatelessWidget {
  BtnLoadingNormal({Key? key}) : super(key: key);
  final _isLoading = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isLoading,
      builder: (_, value, child) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(100.0),
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(const StadiumBorder()),
              backgroundColor: MaterialStateProperty.all(Colors.indigo),
              minimumSize:
                  MaterialStateProperty.all(const Size.fromHeight(50.0)),
            ),
            child: _isLoading.value
                ? Row(
                    children: const [
                      CircularProgressIndicator(color: Colors.red),
                      SizedBox(width: 10),
                      Text(
                        'Please Wait...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  )
                : const Text(
                    'Loading',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
            onPressed: () async {
              _isLoading.value = true;
              await Future.delayed(const Duration(seconds: 3));
              _isLoading.value = false;
            },
          ),
        );
      },
    );
  }
}
