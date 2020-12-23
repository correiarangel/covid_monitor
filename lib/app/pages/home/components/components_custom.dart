import '../../../core/util/value/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ComponentsCustom {
  final TextStyle whiteText = TextStyle(color: Colors.white);

  Padding buildRow(Color color, IconData icon, String titulo, String data) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(children: <Widget>[
          Expanded(
            flex: 3,
            child: buildTile(
              color: color,
              icon: icon,
              title: titulo,
              data: data.toString(),
            ),
          )
        ]));
  }

  Container buildHeader(String titulo, BuildContext _context, _controller,
      {bool isPais = false, String url = ''}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 32.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(21.0),
          bottomRight: Radius.circular(21.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10.0,
          ),
        ],
        color: ConstColors.primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 5.0),
          isPais
              ? Container(
                  alignment: Alignment.topLeft,
                  child: FlatButton.icon(
                    icon: Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                      size: 31.0,
                    ),
                    label: Text(
                      "Pesquisar Pais",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () async {
                      await displayDialog(_context, _controller);
                    },
                  ),
                )
              : SizedBox(),
          const SizedBox(height: 5.0),
          ListTile(
            title: Text(
              titulo,
              style: whiteText.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 21.0),
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 5.0, bottom: 5.0),
              child: Text(
                "Atualizados em ${_controller.word.ultimaAtualizacao.day}/"
                "${_controller.word.ultimaAtualizacao.month}"
                " às ${_controller.word.ultimaAtualizacao.hour}:"
                "${_controller.word.ultimaAtualizacao.minute}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: Colors.white),
              ),
            ),
          ),
          isPais
              ? GestureDetector(
                  onTap: () async {
                    await displayDialog(_context, _controller);
                  },
                  child: Center(
                      child: Image.network(
                    url,
                    width: 100,
                  )),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  displayDialog(BuildContext context, controller) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Covid Monitor...\nSituação de outro País'
              '\nDigiteo o nome do pais em ingles',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            content: TextField(
              controller: controller.textFieldController,
              decoration: InputDecoration(
                  labelText: "Pais:",
                  hintText: "Digite um pais Ex.JAPAN",
                  fillColor: ConstColors.primaryColor),
            ),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  String texte = controller.textFieldController.text.toString();
                  controller.getInfoNation(natioN: texte.toUpperCase());
                  Modular.to.pop();
                  controller.textFieldController.clear();
                },
                child: Text(
                  "Pesquisar",
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                ),
                color: ConstColors.greenColor,
              ),
              FlatButton(
                child: Text(
                  'Cancelar',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: ConstColors.redColor,
                  ),
                ),
                onPressed: () {
                  Modular.to.pop();
                  controller.textFieldController.clear();
                },
              )
            ],
          );
        });
  }

  Container buildTile({Color color, IconData icon, String title, String data}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ListTile(
            leading: Icon(
              icon,
              color: Colors.white,
            ),
            title: Text(
              title,
              style: whiteText.copyWith(fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              data,
              style: whiteText.copyWith(
                  fontWeight: FontWeight.w300, fontSize: 25.0),
            ),
          ),
        ],
      ),
    );
  }

  ///barra inferior
  Widget buildBottomBar(controller) {
    return BottomNavigationBar(
      selectedItemColor: ConstColors.primaryColor,
      unselectedItemColor: Colors.grey,
      backgroundColor: ConstColors.purpleUltraLitghColor,
      currentIndex: controller.currentIndex,
      onTap: controller.changePage,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.group_work),
          // ignore: deprecated_member_use
          title: Text("Mundo"),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.flag,
          ),
          // ignore: deprecated_member_use
          title: Text("Pais"),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.info,
          ),
          // ignore: deprecated_member_use
          title: Text("Info"),
        ),
      ],
    );
  }
}
