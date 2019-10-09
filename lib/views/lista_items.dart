import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';



class MeusItems extends StatefulWidget {
  MeusItems({Key key}) : super(key: key);



  @override
  _MeusItemsState createState() => new _MeusItemsState();
}
class _MeusItemsState extends State<MeusItems> {

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  int _index = 1;
  List<int> _respostas = new List();
  double size = 20.0;
  double activeSize = 30.0;
  PageController controller;
  bool loop = false;


  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller = new PageController();
    super.initState();
  }

  @override
  void didUpdateWidget(MeusItems oldWidget) {
    super.didUpdateWidget(oldWidget);
  }





  @override
  Widget build(BuildContext context) {
    var children = <Widget>[
      //questao 1
      Container(
        child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Você ainda não possui Itens cadastrados clique no botão para cadastrar um Item',
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold)),
            )

        ),

      ),
      //questao 2
      Container(
      child:  Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: FormBuilder(
              key: _fbKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: FormBuilderTextField(
                                attribute: "Apelido",
                                decoration:
                                InputDecoration(labelText: "Apelido"),
                              ),
                            )
                            //container
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: FormBuilderTextField(
                                attribute: "Idade",
                                decoration: InputDecoration(
                                    labelText: "Informe sua Idade"),
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: false),
                                valueTransformer: (text) => num.tryParse(text),
                                validators: [
                                  FormBuilderValidators.numeric(),
                                  FormBuilderValidators.max(110),
                                ],
                              ),
                              //container
                            )
                          ],
                        ),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: FormBuilderDropdown(
                                attribute: "gender",
                                decoration: InputDecoration(labelText: "Sexo:"),
                                hint: Text('Informe seu sexo'),
                                validators: [FormBuilderValidators.required()],
                                items: ['Masculino', 'Feminino']
                                    .map((gender) => DropdownMenuItem(
                                    value: gender, child: Text("$gender")))
                                    .toList(),
                              ),
                            )
                            //container
                          ],
                        ),
                      ),
                      Flexible(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: FormBuilderDropdown(
                                  attribute: "estado",
                                  decoration: InputDecoration(labelText: "Estado"),
                                  // initialValue: 'Male',
                                  hint: Text('Informe seu Estado'),
                                  validators: [
                                    FormBuilderValidators.required(
                                        errorText: "Gentiliza escolher a opcão")
                                  ],
                                  items: [
                                    "AC",
                                    "AL",
                                    "AM",
                                    "AP",
                                    "BA",
                                    "CE",
                                    "DF",
                                    "ES",
                                    "GO",
                                    "MA",
                                    "MT",
                                    "MS",
                                    "MG",
                                    "PA",
                                    "PB",
                                    "PR",
                                    "PE",
                                    "PI",
                                    "RJ",
                                    "RN",
                                    "RO",
                                    "RS",
                                    "RR",
                                    "SC",
                                    "SE",
                                    "SP",
                                    "TO"
                                  ]
                                      .map((grade) => DropdownMenuItem(
                                      value: grade, child: Text("$grade")))
                                      .toList(),
                                ),
                              )
                              //container
                            ],
                          ))
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),

                  FormBuilderDropdown(
                    attribute: "grade",
                    decoration: InputDecoration(labelText: "Escolaridade"),
                    hint: Text('Informe sua escolaridade'),
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "Gentiliza escolher a opcão")
                    ],
                    items: [
                      "Fundamental Incompleto",
                      "Fundamental Completo",
                      "Médio Completo",
                      "Médio Incompleto",
                      "Superior Completo",
                      "Superior Incompleto",
                      "Pós-Graduação"
                    ]
                        .map((grade) => DropdownMenuItem(
                        value: grade, child: Text("$grade")))
                        .toList(),
                  ),

                  //estado

                  //renda
                  FormBuilderDropdown(
                    attribute: "renda",
                    decoration: InputDecoration(labelText: "Renda"),
                    hint: Text('Informe sua renda'),
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "Gentiliza escolher a opcão")
                    ],
                    items: [
                      "até um salário minimo",
                      "Até três salarios minimos",
                      "Até cinco salarios minimos",
                      "Superior a cinco salarios minimos ",
                    ]
                        .map((renda) => DropdownMenuItem(
                        value: renda, child: Text("$renda")))
                        .toList(),
                  ),

                  FormBuilderTextField(
                    attribute: "email",
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      hintText: 'Informe o seu E-mail',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validators: [
                      FormBuilderValidators.email(
                          errorText: "Necessário informar E-mail valido.")
                    ],
                  ),

                  FormBuilderTextField(
                    obscureText: true,
                    attribute: "senha",
                    decoration: InputDecoration(labelText: "Senha"),
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "A senha não deve ser vazia"),
                      FormBuilderValidators.minLength(6,
                          errorText: "A senha devera ter no minimo 6 letras")
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0, top: 100.0, right: 20.0),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.blue,
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                onPressed: () {

                },
                child: Text(
                  "Cadastrar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),

      ),
      //questao 3
      Container(

      ),
      //questao 4

    ];
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: new Column(
          children: <Widget>[
            new Expanded(
                child: new Stack(
                  children: <Widget>[
                    loop
                        ? new TransformerPageView.children(
                      physics: new NeverScrollableScrollPhysics(),
                      children: children,
                      pageController: controller,
                    )
                        : new PageView(
                      controller: controller,
                      children: children,
                      physics: new NeverScrollableScrollPhysics(),
                    ),

                  ],
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.nextPage(
              duration: Duration(milliseconds: 400), curve: Curves.linear);
    },
    child: Icon(Icons.add),
    backgroundColor: Colors.red,
    ),
    )
    ;
  }
}
