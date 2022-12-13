
// import '../providers/category.dart';

// class CategoryList extends StatelessWidget {
//   const CategoryList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final cat = Provider.of<Categories>(context).cat;

//     return Container(
//       height: MediaQuery.of(context).size.height *0.8,
//         child: ListView.builder(
//       itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
//         value: cat[i],
//         child: CategoryHolder(
//           category: cat[i],
//         )),
//       itemCount: cat.length,
//     ));
//   }
// }
