import 'package:flutter/material.dart';
import 'package:shop_app/utils/main_button.dart';
import 'package:shop_app/utils/styles.dart';

class SortAndFilter extends StatelessWidget {
  const SortAndFilter({
    Key? key,
    required this.onSort,
    required this.sort,
    required this.sortValue,
    required this.onFilter,
    required this.filter,
    required this.filterValue,
  }) : super(key: key);

  final List<SortModel>? sort;
  final String? sortValue;
  final Function(String sort)? onSort;
  final List<FilterModel>? filter;
  final List<String>? filterValue;
  final Function(List<String> filter)? onFilter;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: const BoxDecoration(
        color:  Colors.white,
        borderRadius: BorderRadius.only(
            topLeft:Radius.circular(20.0),
            topRight: Radius.circular(20.0)),
      ),

      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: const BoxDecoration(
                color:  Colors.red,
                borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: const TabBar(
                indicatorWeight: 6.0,
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                tabs: [Tab(text: "Sort"), Tab(text: "Filter")],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Sort(
                    onSort: onSort!,
                    sort: sort!,
                    sortValue: sortValue!,
                  ),
                  Filter(
                    filter: filter,
                    filterValue: filterValue,
                    onFilter: onFilter,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SortModel {
  final String? title;

  final String? value;

  const SortModel(this.title, this.value);
}

class Sort extends StatefulWidget {
  const Sort({
    Key? key,
    required this.onSort,
    required this.sort,
    required this.sortValue,
  }) : super(key: key);
  final Function(String sort) onSort;
  final List<SortModel> sort;
  final String sortValue;

  @override
  _SortState createState() => _SortState();
}

class _SortState extends State<Sort> {
  String? sort;
  String? a=0.toString();

  @override
  void initState() {
    super.initState();
    sort = widget.sortValue;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
      color: Colors.white,
            // height:50.h,
            child: ListView(
              shrinkWrap: true,
              children: [
                for (int i = 0; i < widget.sort.length; i++)
                  RadioListTile<String>(
                    title: Text(
                    widget.sort[i].title.toString() ,
                      style: const TextStyle(color: Colors.black,fontSize: 14),
                    ),
                    activeColor: Colors.red,
                    value: widget.sort[i].value!,
                    groupValue: sort,
                    onChanged: (value) {
                      setState(() => sort = value!);
                      widget.onSort(value!);
                    },
                  ),
              ],
            ),
    );
  }
}

class FilterModel {

  final String? title;
  final String? value;

  FilterModel(this.title, this.value);
}

class Filter extends StatefulWidget {
  const Filter({Key? key, this.filter, this.onFilter, this.filterValue, this.category}) : super(key: key);
  final String? category;
  final List<FilterModel>? filter;
  final List<String>? filterValue;

  final Function(List<String> filterValue)? onFilter;

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  Map<String, bool> f = {};
  @override
  void initState() {
    super.initState();
    widget.filterValue!.forEach((element) {
      f[element] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Column(
              children: [
                widget.category==null?const SizedBox():
                Text(widget.category.toString(),style: TextStyles.subHeaderStyle,),
                for (int i = 0; i < widget.filter!.length; i++)
                  CheckboxListTile(
                    activeColor: Colors.black,
                    checkColor: Colors.white,

                    title: Text(
                    widget.filter![i].title!,
                      style: const TextStyle(color: Colors.black),
                    ),
                    value: f.containsKey(widget.filter![i].value),
                    onChanged: (value) {
                      if (!value!) {
                        setState(() => f.remove(widget.filter![i].value));
                      } else {
                        setState(() => f[widget.filter![i].value!] = true);
                      }
                    },
                  ),
                MainButton(
                  onPressed:(){
                    widget.onFilter!(f.keys.toList());
                  },

                  width: 200,
                  text: "Apply",
                ),
                const SizedBox(height: 10)
              ],
            ),

    );
  }
}