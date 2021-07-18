// import 'package:adotappet/constants/app_constants.dart';
import 'package:adotappet/constants/app_constants.dart';
import 'package:adotappet/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CadastroUser extends StatefulWidget {
  const CadastroUser({Key? key}) : super(key: key);

  @override
  _CadastroUserState createState() => _CadastroUserState();
}

class _CadastroUserState extends State<CadastroUser> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _telInputController = TextEditingController();
  TextEditingController _cpfInputController = TextEditingController();
  TextEditingController _cepInputController = TextEditingController();
  TextEditingController _lograInputController = TextEditingController();
  TextEditingController _numInputController = TextEditingController();
  TextEditingController _complInputController = TextEditingController();
  TextEditingController _bairrolInputController = TextEditingController();
  TextEditingController _cidadelInputController = TextEditingController();
  TextEditingController _tipoResiInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        // height: 2000,
        // width: MediaQuery.of(context).size.width,
        // margin: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              // height: 600.0,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.fromBorderSide(
                  BorderSide(color: Colors.orange),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  _montaHeaderCadastro(context),
                  _montaFormularioDadosCadastrais(context),
                ],
              ),
            ),
            _montaBotaoCadastro(context),
          ],
        ),
      ),
    );
  }

  _montaHeaderCadastro(context) {
    return Row(
      children: [
        Image(
          image: AssetImage('assets/images/sucesso.png'),
          width: 48,
          height: 48,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            "Preencha os campos abaixo com \ndados reais sobre você ",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  _montaFormularioDadosCadastrais(context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _montaInput(
              inputControler: _nameInputController,
              icone: Icons.person,
              nomeCampo: "Nome completo",
              tamanhoMin: 10,
              tamanhoMax: 30),
          _montaInput(
              inputControler: _mailInputController,
              icone: Icons.mail,
              nomeCampo: "E-mail",
              tamanhoMin: 5,
              tamanhoMax: 64,
              tipo: "email"),
          _montaInput(
              inputControler: _telInputController,
              icone: Icons.phone,
              nomeCampo: "Telefone",
              tamanhoMin: 5,
              tamanhoMax: 64,
              tipo: "numerico"),
          _montaInput(
              inputControler: _cpfInputController,
              icone: Icons.description,
              nomeCampo: "CPF",
              tamanhoMin: 11,
              tamanhoMax: 11,
              tipo: "numerico"),
          _montaInput(
              inputControler: _cepInputController,
              icone: Icons.other_houses,
              nomeCampo: "CEP",
              tamanhoMin: 8,
              tamanhoMax: 8,
              tipo: "numerico"),
          _montaInput(
              inputControler: _lograInputController,
              icone: Icons.other_houses,
              nomeCampo: "Logradouro",
              tamanhoMin: 10,
              tamanhoMax: 30),
          _montaInput(
              inputControler: _numInputController,
              icone: Icons.other_houses,
              nomeCampo: "Numero",
              tamanhoMin: 8,
              tamanhoMax: 8,
              tipo: "numerico"),
          _montaInput(
              inputControler: _complInputController,
              icone: Icons.other_houses,
              nomeCampo: "Complemento",
              tamanhoMin: 4,
              tamanhoMax: 30),
          _montaInput(
              inputControler: _bairrolInputController,
              icone: Icons.other_houses,
              nomeCampo: "Bairro",
              tamanhoMin: 10,
              tamanhoMax: 30),
          _montaInput(
              inputControler: _cidadelInputController,
              icone: Icons.other_houses,
              nomeCampo: "Cidade",
              tamanhoMin: 10,
              tamanhoMax: 30),
          _montaInput(
              inputControler: _tipoResiInputController,
              icone: Icons.other_houses,
              nomeCampo: "Tipo residencia",
              tamanhoMin: 10,
              tamanhoMax: 30),
          _montaTextArea(
            context,
          )
          // getWidgetEspacoParabaixo(15),
          // _montaInputSenha(),
        ],
      ),
    );
  }

  _montaInput(
      {inputControler, nomeCampo, icone, tamanhoMin, tamanhoMax, tipo}) {
    //tipos
    //alphanumerico, numerico, senha, email

    TextInputType tipoDeInput;
    if (tipo == "numerico") {
      tipoDeInput = TextInputType.phone;
    } else if (tipo == "email") {
      tipoDeInput = TextInputType.emailAddress;
    } else {
      tipoDeInput = TextInputType.text;
    }

    return TextFormField(
      keyboardType: tipoDeInput,
      validator: (value) {
        _validarInput(
            conteudoInput: value,
            name: nomeCampo,
            tamanhoMin: tamanhoMin,
            tamanhoMax: tamanhoMax,
            tipo: tipo);
      },
      controller: inputControler,
      autofocus: true,
      style: TextStyle(color: Colors.grey),
      decoration: _decorarInputs(nome: nomeCampo, icone: icone),
    );
  }

  _validarInput({conteudoInput, name, tamanhoMin, tamanhoMax, tipo}) {
    print("validou krai");

    if (conteudoInput!.length < tamanhoMin) {
      return 'Esse $name parece curto demais';
    } else {
      if (tipo == "email") {
        if (!conteudoInput.contains("@")) {
          return "Esse $name está meio estranho, não?";
        }
      }
      return null;
    }
  }

  _decorarInputs({nome, icone}) {
    return InputDecoration(
      labelText: nome,
      // labelStyle: TextStyle(
      //   decorationColor: Colors.blue,
      // ),

      // prefixIcon: Icon(
      //   icone,
      //   color: Colors.grey,
      // ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.orangeAccent,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
    );
  }

  _montaTextArea(context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        maxLines: 8,
        style: TextStyle(
            color: Colors.grey, fontSize: 12, fontStyle: FontStyle.italic),
        decoration: InputDecoration.collapsed(
            fillColor: Colors.blue,
            border: OutlineInputBorder(),
            hintText: "Fale um pouco sobre você e porque quer adotar um pet"),
      ),
    );
  }

  _montaBotaoCadastro(context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(top: 24),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
                return Colors.orange.shade400;
              return AppColors.primary;
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(color: AppColors.primary),
            ),
          ),
        ),
        onPressed: () => {print("clicou")},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'ENVIAR!',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
