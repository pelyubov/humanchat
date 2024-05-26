import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:humanchat/common/languages.dart';
import 'package:humanchat/entities/user.entity.dart';
import 'package:humanchat/features/user/presentation/bloc/user.bloc.dart';

class AddChatPage extends StatefulWidget {
  const AddChatPage({super.key});

  @override
  State<AddChatPage> createState() => _AddChatPageState();
}

class _AddChatPageState extends State<AddChatPage> {
  final userBloc = Get.put(UserBloc());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text(Languages.addChatTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: Languages.name),
                validator: (value) {
                  return value!.trim().isEmpty ? 'Required' : null;
                },
              ),
              const MaxGap(20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Thành viên'),
                validator: (value) {
                  return value!.trim().isEmpty ? 'Required' : null;
                },
                maxLines: null,
              ),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return userBloc.users.value.map((User e) => e.username).where(
                        (element) => element.toLowerCase().contains(
                              textEditingValue.text.toLowerCase(),
                            ),
                      );
                },
                onSelected: (String selection) {
                  log('You just selected $selection');
                },
              ),
              const Expanded(child: SizedBox()),
              ElevatedButton(
                onPressed: () => formKey.currentState!.validate(),
                child: const Text('Xác nhận'),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
