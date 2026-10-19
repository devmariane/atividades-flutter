
import 'package:flutter/material.dart';
import 'dart:convert';

import 'dart:io' as io;

class PostService {
  static final Uri _postsUri =
      Uri.parse('https://jsonplaceholder.typicode.com/posts');

  static Future<List<dynamic>> getPosts() async {
    final response = await _request('GET', _postsUri);
    _ensureSuccess(response);
    return jsonDecode(response.body) as List<dynamic>;
  }

  static Future<Map<String, dynamic>> getPost(int id) async {
    final response = await _request('GET', _postUri(id));
    _ensureSuccess(response);
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  static Future<Map<String, dynamic>> createPost(
    String title,
    String body,
  ) async {
    final response = await _request(
      'POST',
      _postsUri,
      body: {'title': title, 'body': body, 'userId': 1},
    );
    _ensureSuccess(response);
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  static Future<void> updatePost(int id, String title, String body) async {
    final response = await _request(
      'PUT',
      _postUri(id),
      body: {'id': id, 'title': title, 'body': body, 'userId': 1},
    );
    _ensureSuccess(response);
  }

  static Future<void> deletePost(int id) async {
    final response = await _request('DELETE', _postUri(id));
    _ensureSuccess(response);
  }

  static Uri _postUri(int id) => Uri.parse('${_postsUri.toString()}/$id');

  static Future<_PostResponse> _request(
    String method,
    Uri uri, {
    Map<String, dynamic>? body,
  }) async {
    final client = io.HttpClient();
    try {
      final request = await client.openUrl(method, uri);
      if (body != null) {
        request.headers.contentType = io.ContentType.json;
        request.write(jsonEncode(body));
      }
      final response = await request.close();
      final responseBody = await utf8.decoder.bind(response).join();
      return _PostResponse(
        response.statusCode,
        response.reasonPhrase,
        responseBody,
      );
    } finally {
      client.close();
    }
  }

  static void _ensureSuccess(_PostResponse response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('HTTP ${response.statusCode}: ${response.reasonPhrase}');
    }
  }
}

class _PostResponse {
  const _PostResponse(this.statusCode, this.reasonPhrase, this.body);

  final int statusCode;
  final String reasonPhrase;
  final String body;
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PostsPage(),
  ));
}

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final idController = TextEditingController();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  List<dynamic> posts = [];
  String mensagem = '';
  bool carregando = false;

  Future<void> listar() async {
    setState(() => carregando = true);

    try {
      final resultado = await PostService.getPosts();

      if (!mounted) return;

      setState(() {
        posts = resultado;
        mensagem = 'Lista carregada: ${posts.length} publicações.';
      });
    } catch (e) {
      if (mounted) setState(() => mensagem = 'Erro: $e');
    } finally {
      if (mounted) setState(() => carregando = false);
    }
  }

  Future<void> buscar() async {
    final id = int.tryParse(idController.text);

    if (id == null || id < 1) {
      setState(() => mensagem = 'Digite um ID válido.');
      return;
    }

    setState(() => carregando = true);

    try {
      final post = await PostService.getPost(id);

      if (!mounted) return;

      setState(() {
        titleController.text = post['title']?.toString() ?? '';
        bodyController.text = post['body']?.toString() ?? '';
        mensagem = 'Publicação encontrada.';
      });
    } catch (e) {
      if (mounted) setState(() => mensagem = 'Erro: $e');
    } finally {
      if (mounted) setState(() => carregando = false);
    }
  }

  Future<void> criar() async {
    if (titleController.text.trim().isEmpty ||
        bodyController.text.trim().isEmpty) {
      setState(() => mensagem = 'Preencha o título e o conteúdo.');
      return;
    }

    setState(() => carregando = true);

    try {
      final post = await PostService.createPost(
        titleController.text.trim(),
        bodyController.text.trim(),
      );

      if (!mounted) return;

      setState(() {
        idController.text = post['id'].toString();
        mensagem = 'POST realizado! ID: ${post['id']}';
      });
    } catch (e) {
      if (mounted) setState(() => mensagem = 'Erro: $e');
    } finally {
      if (mounted) setState(() => carregando = false);
    }
  }

  Future<void> atualizar() async {
    final id = int.tryParse(idController.text);

    if (id == null || id < 1) {
      setState(() => mensagem = 'Digite um ID válido.');
      return;
    }

    setState(() => carregando = true);

    try {
      await PostService.updatePost(
        id,
        titleController.text.trim(),
        bodyController.text.trim(),
      );

      if (mounted) {
        setState(() => mensagem = 'PUT realizado com sucesso!');
      }
    } catch (e) {
      if (mounted) setState(() => mensagem = 'Erro: $e');
    } finally {
      if (mounted) setState(() => carregando = false);
    }
  }

  Future<void> excluir() async {
    final id = int.tryParse(idController.text);

    if (id == null || id < 1) {
      setState(() => mensagem = 'Digite um ID válido.');
      return;
    }

    setState(() => carregando = true);

    try {
      await PostService.deletePost(id);

      if (!mounted) return;

      setState(() {
        posts.removeWhere((post) => post['id'] == id);
        mensagem = 'DELETE realizado para o ID $id.';
        titleController.clear();
        bodyController.clear();
      });
    } catch (e) {
      if (mounted) setState(() => mensagem = 'Erro: $e');
    } finally {
      if (mounted) setState(() => carregando = false);
    }
  }

  void selecionarPost(Map<String, dynamic> post) {
    setState(() {
      idController.text = post['id'].toString();
      titleController.text = post['title']?.toString() ?? '';
      bodyController.text = post['body']?.toString() ?? '';
      mensagem = 'Publicação ${post['id']} selecionada.';
    });
  }

  @override
  void dispose() {
    idController.dispose();
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD - JSONPlaceholder'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: idController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'ID da publicação',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Título',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: bodyController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Conteúdo',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: carregando ? null : listar,
                child: const Text('GET Lista'),
              ),
              ElevatedButton(
                onPressed: carregando ? null : buscar,
                child: const Text('GET por ID'),
              ),
              ElevatedButton(
                onPressed: carregando ? null : criar,
                child: const Text('POST'),
              ),
              ElevatedButton(
                onPressed: carregando ? null : atualizar,
                child: const Text('PUT'),
              ),
              ElevatedButton(
                onPressed: carregando ? null : excluir,
                child: const Text('DELETE'),
              ),
            ],
          ),
          if (carregando)
            const Padding(
              padding: EdgeInsets.all(12),
              child: Center(child: CircularProgressIndicator()),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(mensagem),
          ),
          const Divider(),
          const Text(
            'Publicações',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ...posts.map((item) {
            final post = Map<String, dynamic>.from(item);

            return Card(
              child: ListTile(
                title: Text('${post['id']} - ${post['title']}'),
                subtitle: Text(post['body']?.toString() ?? ''),
                onTap: () => selecionarPost(post),
              ),
            );
          }),
        ],
      ),
    );
  }
}
