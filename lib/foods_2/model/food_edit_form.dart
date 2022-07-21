// import 'package:flutter/material.dart';
//
// class FoodEditForm extends StatefulWidget {
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController title();
//   final tag1 = TextEditingController();
//   final tag2 = TextEditingController();
//
//   FoodEditForm(this.selectedCategory, this.payedAmount, this.payedDate,
//   this.format, this.formKey,
//   const ({Key? key}) : super(key: key);
//
//   @override
//   State<FoodEditForm> createState() => _FoodEditForm();
// }
//
// class _FoodEditForm extends State<FoodEditForm> {
//   @override
//   Widget build(BuildContext context) {
//
//                 return Form(
//                   key: widget.formKey,
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         controller: title,
//                         decoration: InputDecoration(
//                           hintText: "料理名を入力してください",
//                           icon: Icon(Icons.text_fields_outlined),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return '入力してください';
//                           }
//                           return null;
//                         },
//                       ),
//                       Wrap(
//                         children:
//                         List<Widget>.generate(_choiceList.length, (int index) {
//                           return Padding(
//                             padding: const EdgeInsets.all(2.0),
//                             child: ChoiceChip(
//                               selectedColor: Colors.green,
//                               label: Text(_choiceList[index]),
//                               //selectしてるかしてないか
//                               selected:
//                               //[]の中にkeyとして文字列(_choices)を入れてる
//                               //2行上のlabelと同じものを入れてる
//                               //HashMapに対してこう書くとtrueかfalseが返る
//                               state.tagSelectState?[_choiceList[index]] ?? false,
//                               onSelected: (newBoolValue) {
//                                 //trueだったらfalse返ってくる(逆も)
//                                 notifier.toggleTagChip(
//                                     _choiceList[index], newBoolValue);
//                               },
//                             ),
//                           );
//                         }),
//                       ),
//                     ],
//                   ),
//                 );
//               }),
//         ),
//         actions: <Widget>[
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text("キャンセル"),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               //バリデーションない時だけ保存処理実行
//               if (formKey.currentState!.validate()) {
//                 //FoodsCompanionを初期化してる・「newFood」を作ってる
//                 final newFood = FoodsCompanion(
//                   title: drift.Value(title.text),
//                   tag1: drift.Value(tag1.text),
//                   tag2: drift.Value(tag2.text),
//
//                 );
//                 //作った「_newTodo」を_notifierのinsertTodoDataに渡してる
//                 //これで内部的にrepositoryを呼んでDBへの書き込みがされる
//                 notifier.insertFoodData(newFood);
//                 Navigator.pop(context);
//               }
//             },
//             child: Text("保存"),
//           )
//         ],
//       );
//     },
//   }
// }
