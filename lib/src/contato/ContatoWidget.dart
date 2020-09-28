import 'package:flutter/material.dart';
import 'package:teste_moor/src/db/my_database.dart';

class ContatoWidget extends StatefulWidget {
  @override
  _ContatoWidgetState createState() => _ContatoWidgetState();
}

class _ContatoWidgetState extends State<ContatoWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddContato();
                }));
              })
        ],
      ),
      body: StreamBuilder<List<Contato>>(
          stream: MyDatabase.instance.contatoDAO.listAll(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();

            List<Contato> contatos = snapshot.data;
            return ListView.builder(
                itemCount: contatos.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(contatos[index].nome),
                    subtitle: Text(contatos[index].email),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_outline),
                      onPressed: () {
                        setState(() {
                          Contato contato = snapshot.data[index];
                          MyDatabase.instance.contatoDAO
                              .removeContato(contato.id);
                        });
                      },
                      color: Colors.red,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return UpdateContato(snapshot.data[index]);
                      }));
                    },
                  );
                });
          }),
    );
  }
}

class AddContato extends StatefulWidget {
  @override
  _AddContatoState createState() => _AddContatoState();
}

class _AddContatoState extends State<AddContato> {
  String nome;
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar contato')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Nome'),
              onChanged: (text) {
                nome = text;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'E-mail'),
              onChanged: (text) {
                email = text;
              },
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('Adicionar'),
              onPressed: () {
                MyDatabase.instance.contatoDAO
                    .addContato(Contato(nome: nome, email: email));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class UpdateContato extends StatefulWidget {
  Contato contato;

  UpdateContato(this.contato);
  @override
  _UpdateContatoState createState() => _UpdateContatoState();
}

class _UpdateContatoState extends State<UpdateContato> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();

  String nome;
  String email;

  Contato contato;

  @override
  void initState() {
    super.initState();

    _nomeController.text = widget.contato.nome;
    _emailController.text = widget.contato.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Atualizar contato')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(border: OutlineInputBorder()),
              onChanged: (text) {
                nome = text;
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(border: OutlineInputBorder()),
              onChanged: (text) {
                email = text;
              },
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('Atualizar'),
              onPressed: () {
                MyDatabase.instance.contatoDAO.updateContato(
                    Contato(id: widget.contato.id, nome: nome, email: email));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
