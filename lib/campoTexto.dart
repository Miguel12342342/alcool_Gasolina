import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class campo_Texto extends StatefulWidget {
  const campo_Texto({super.key});

  @override
  State<campo_Texto> createState() => _campo_TextoState();
}

// ignore: camel_case_types
class _campo_TextoState extends State<campo_Texto> {

final TextEditingController alcoolController = TextEditingController();
final TextEditingController gasolinaController = TextEditingController();
      String  _textoResultado = ""; 

void calcular(){

double? precoAlcool = double.tryParse(alcoolController.text); 
double? precoGasolina = double.tryParse(gasolinaController.text);


/*
void _limparCampos(){
  gasolinaController.text = "";
  alcoolController.text = "";
}
*/

// 2. Agora o teste '== null' funciona corretamente
if (precoAlcool == null || precoGasolina == null) {
    setState(() {
      _textoResultado = "preço inválido, digite números maiores que 0 e utlizando (.)";
    });
} else {
   if((precoAlcool / precoGasolina ) >= 0.7){
    setState(() {
      _textoResultado = "Melhor abastecer com gasolina";
    });
   }else{
     setState(() {
      _textoResultado = "Melhor abastecer com Alcool";
    });
   }
  // _limparCampos();
}



}
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Text("Álcool ou Gasolina",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
                  Padding(padding: EdgeInsetsGeometry.only(bottom: 32),
                  child: Image.asset("images/logo.png"),),
                  Padding(padding: EdgeInsetsGeometry.only(bottom: 10),
                  child:  Text("Saiba qual a melhor opção para abastecimento do seu carro ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 25
               ),),),            
                  SizedBox(
                    width: 250,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Preço Álcool, ex: 4.13",
                      ),
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                      ],
                      maxLength: 4,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),              
                      controller: alcoolController,
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: TextField(                 
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Preço Gasolina, ex: 5.50",
                      ),
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                      ],
                      maxLength: 4,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),                      
                      controller: gasolinaController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      onPressed: (){
                    calcular();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.all(15),                
                    ), child: Text('Calcular',
                    style: TextStyle(
                      color: Colors.white,
                       fontSize: 20
                    ),),                
                    ),
                  ), 
                  Padding(padding: EdgeInsets.only(top:20),
                  child: Text(_textoResultado,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  ),              
          ],
        ),
        ),
      )
    );
  }
}