import 'package:adotappet/config/routes/routes.dart';
import 'package:adotappet/constants/app_constants.dart';
import 'package:adotappet/controllers/usuario_controller.dart';
import 'package:adotappet/models/endereco.dart';
import 'package:adotappet/models/usuario.dart';
import 'package:adotappet/utils/mixins/mixin.dart';
import 'package:adotappet/widgets/custom_app_bar.dart';
import 'package:adotappet/widgets/side_menu_bar.dart';
import 'package:adotappet/widgets/user_transform.dart';
import 'package:flutter/material.dart';

class CadastroUser extends StatefulWidget {
  const CadastroUser({Key? key}) : super(key: key);

  @override
  _CadastroUserState createState() => _CadastroUserState();
}

class _CadastroUserState extends State<CadastroUser> with Login {
  final _formKey = GlobalKey<FormState>();
  final UsuarioController _usuarioController = UsuarioController();
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _telInputController = TextEditingController();
  TextEditingController _cpfInputController = TextEditingController();
  TextEditingController _cepInputController = TextEditingController();
  TextEditingController _lograInputController = TextEditingController();
  TextEditingController _numInputController = TextEditingController();
  TextEditingController _complInputController = TextEditingController();
  TextEditingController _bairroInputController = TextEditingController();
  TextEditingController _cidadeInputController = TextEditingController();
  TextEditingController _estadoInputController = TextEditingController();
  TextEditingController _tipoResiInputController = TextEditingController();
  TextEditingController _texAreaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initFields();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SideMenuBar(),

        // Content page
        UserTransform(
          leftSlide: leftSlide,
          child: Scaffold(
            appBar: CustomAppBar(
              onAvatarClick: () => this.showHideUser(),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
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
          ),
        )
      ],
    );
  }

  _montaHeaderCadastro(context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Image(
            image: AssetImage('assets/images/sucesso.png'),
            width: 48,
            height: 48,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, top: 10),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            _montaInput(
                inputControler: _nameInputController,
                nomeCampo: "Nome completo",
                tamanhoMin: 5,
                tamanhoMax: 30),
            _montaInput(
                inputControler: _mailInputController,
                nomeCampo: "E-mail",
                tamanhoMin: 5,
                tamanhoMax: 64,
                tipo: "email"),
            _montaInput(
                inputControler: _telInputController,
                nomeCampo: "Telefone",
                tamanhoMin: 8,
                tamanhoMax: 20,
                tipo: "numerico"),
            _montaInput(
                inputControler: _cpfInputController,
                nomeCampo: "CPF",
                tamanhoMin: 11,
                tamanhoMax: 11,
                tipo: "numerico"),
            _montaInput(
                inputControler: _cepInputController,
                nomeCampo: "CEP",
                tamanhoMin: 8,
                tamanhoMax: 8,
                tipo: "numerico"),
            _montaInput(
                inputControler: _lograInputController,
                nomeCampo: "Logradouro",
                tamanhoMin: 10,
                tamanhoMax: 30),
            _montaInput(
                inputControler: _numInputController,
                nomeCampo: "Numero",
                tamanhoMin: 1,
                tamanhoMax: 8,
                tipo: "numerico"),
            _montaInput(
                inputControler: _complInputController,
                nomeCampo: "Complemento",
                tamanhoMin: 4,
                tamanhoMax: 30),
            _montaInput(
                inputControler: _bairroInputController,
                nomeCampo: "Bairro",
                tamanhoMin: 10,
                tamanhoMax: 30),
            _montaInput(
                inputControler: _cidadeInputController,
                nomeCampo: "Cidade",
                tamanhoMin: 10,
                tamanhoMax: 30),
            _montaInput(
                inputControler: _estadoInputController,
                nomeCampo: "Estado",
                tamanhoMin: 2,
                tamanhoMax: 2),
            _montaInput(
                inputControler: _tipoResiInputController,
                nomeCampo: "Tipo residencia",
                tamanhoMin: 1,
                tamanhoMax: 30),
            _montaTextArea(
              context: context,
              inputController: _texAreaController,
            ),
          ],
        ),
      ),
    );
  }

  _montaInput(
      {inputControler, nomeCampo, tamanhoMin, tamanhoMax, tipo, initialValue}) {
    //tipos: alphanumerico, numerico, senha, email

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
        return _validarInput(
            conteudoInput: value,
            name: nomeCampo,
            tamanhoMin: tamanhoMin,
            tamanhoMax: tamanhoMax,
            tipo: tipo);
      },
      controller: inputControler,
      autofocus: true,
      style: TextStyle(color: Colors.grey),
      decoration: _decorarInputs(nome: nomeCampo),
    );
  }

  _validarInput({conteudoInput, name, tamanhoMin, tamanhoMax, tipo}) {
    if (conteudoInput!.length < tamanhoMin) {
      return 'Esse $name parece curto demais';
    } else {
      if (tipo == "email") {
        if (!conteudoInput.contains("@")) {
          return "Esse $name está meio estranho, não?";
        }
        if (!conteudoInput.contains(".com")) {
          return "Esse $name está meio estranho, não?";
        }
      }
      return null;
    }
  }

  _decorarInputs({nome}) {
    return InputDecoration(
      labelText: nome,
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.orange,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
    );
  }

  _montaTextArea({context, inputController}) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: _texAreaController,
        maxLines: 8,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 14,
          fontStyle: FontStyle.italic,
        ),
        autofocus: true,
        decoration: _decorarInputs(
          nome: "Fale um pouco sobre você e porque quer adotar um pet",
        ),
      ),
    );
  }

  _montaBotaoCadastro(context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(top: 10, bottom: 10),
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
        onPressed: () => _acaoCadastrar(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'ENVIAR!',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _acaoCadastrar(context) {
    if (_formKey.currentState!.validate()) {
      _usuarioController
          .update(_montaUsuarioRequest())
          .then(
              (value) => Navigator.of(context).pushNamed(Routes.order_created))
          .onError((error, stackTrace) => {
                print(stackTrace),
                print(error),
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Erro ao atualizar cadastro'),
                        content: Text(error.toString()),
                      );
                    })
              });
    } else {
      print("Form com dado(s) invalido(s)");
    }
  }

  Usuario _montaUsuarioRequest() {
    return Usuario(
        nomeCompleto: _nameInputController.text,
        email: _mailInputController.text,
        telefone: _telInputController.text,
        cpf: _cpfInputController.text,
        endereco: _montaEnderecoRequest());
  }

  Endereco _montaEnderecoRequest() {
    return Endereco(
        complemento: _complInputController.text,
        logradouro: _lograInputController.text,
        numero: int.parse(_numInputController.text),
        cidade: _cidadeInputController.text,
        tipoResidencia: _tipoResiInputController.text,
        bairro: _bairroInputController.text,
        estado: 'SP',
        cep: int.parse(_cepInputController.text));
  }

  void _initFields() {
    _nameInputController.text = _usuarioController.usuario!.nomeCompleto == null
        ? ""
        : _usuarioController.usuario!.nomeCompleto.toString();
    _mailInputController.text = _usuarioController.usuario!.email == null
        ? ""
        : _usuarioController.usuario!.email.toString();
    _telInputController.text = _usuarioController.usuario!.telefone == null
        ? ""
        : _usuarioController.usuario!.telefone.toString();
    _cpfInputController.text = _usuarioController.usuario!.cpf == null
        ? ""
        : _usuarioController.usuario!.cpf.toString();
    if (_usuarioController.usuario!.endereco != null) {
      _cepInputController.text =
      _usuarioController.usuario!.endereco!.cep == null
          ? ""
          : _usuarioController.usuario!.endereco!.cep.toString();
      _lograInputController.text =
      _usuarioController.usuario!.endereco!.logradouro == null
          ? ""
          : _usuarioController.usuario!.endereco!.logradouro.toString();
      _numInputController.text =
      _usuarioController.usuario!.endereco!.numero == null
          ? ""
          : _usuarioController.usuario!.endereco!.numero.toString();
      _complInputController.text =
      _usuarioController.usuario!.endereco!.complemento == null
          ? ""
          : _usuarioController.usuario!.endereco!.complemento.toString();
      _bairroInputController.text =
      _usuarioController.usuario!.endereco!.bairro == null
          ? ""
          : _usuarioController.usuario!.endereco!.bairro.toString();
      _cidadeInputController.text =
      _usuarioController.usuario!.endereco!.cidade == null
          ? ""
          : _usuarioController.usuario!.endereco!.cidade.toString();
      _estadoInputController.text =
      _usuarioController.usuario!.endereco!.estado == null
          ? ""
          : _usuarioController.usuario!.endereco!.estado.toString();
      _tipoResiInputController.text =
      _usuarioController.usuario!.endereco!.tipoResidencia == null
          ? ""
          : _usuarioController.usuario!.endereco!.tipoResidencia.toString();
    }
  }
}
