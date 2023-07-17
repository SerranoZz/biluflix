import 'package:catalogo_video/pages/catalog.dart';
import 'package:catalogo_video/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:catalogo_video/pages/navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override

  void imprime(){
    print('Login');
  }

  void changeToCatalog(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NavBar()), // Substitua "NovaTela" pelo nome da tela para a qual deseja navegar
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Colors.black, Color(0xE520083C)],
          ),
        ),
        child: Center(
          child: Container(
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/et.png', // Substitua pelo caminho da sua imagem
                  width: 140, // Ajuste a largura da imagem conforme necessário
                  height: 140, // Ajuste a altura da imagem conforme necessário
                ),
                _buildText('Login', Colors.white, 30),
                _buildText('Olá, seja bem-vindo(a)', Colors.white, 21),
                _buildTextLabel('Email:', Colors.white, 300, false),
                _buildTextLabel('Senha:', Colors.white, 300, true),
                _buildButton('LOGIN', Color(0xFFFFF400), 300, imprime),
                Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildText('Ainda não tem cadastro?' , Colors.white, 16),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()), // Substitua "NovaTela" pelo nome da tela para a qual deseja navegar
                          );
                        },
                        child: Text(
                          'Clique aqui',
                          style: GoogleFonts.lexendDeca(
                              textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFF400),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),        
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFF0F0F0),
                      ),
                    ),
                  ),
                ),
                _buildButton('Entrar sem login', Colors.white, 300, changeToCatalog),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText(String text, Color color, double size) {
    return Text(
      text,
      style: 
        GoogleFonts.lexendDeca(
          textStyle: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w400,
          color: color,
        ),
      ),
    );
  }

  Widget _buildTextLabel(String text, Color color, double width, senha){
    return(
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            text,
            style: 
              GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),

          Container(
            height: 40.0,
            width: width,
            child: TextField(
              decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                contentPadding: EdgeInsets.only(left: 5),
              ),
              obscureText: senha,
              style: GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            ),
          ),
        ]),
      )
    );
  }

  Widget _buildButton(String text, Color color, double width, VoidCallback onPressed){
    return ElevatedButton(
        onPressed: onPressed,
        child: 
        Text(
          text,
          style: GoogleFonts.lexendDeca(
                textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
        ),

        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(width, 40.0)),
          fixedSize: MaterialStateProperty.all(Size(width, 40.0)),
          backgroundColor: MaterialStateProperty.all(color),
        ),
    );
  }

}
