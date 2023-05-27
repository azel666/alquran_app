import 'package:alquran_app/common/constants.dart';
import 'package:alquran_app/cubit/ayat/ayat_cubit.dart';
import 'package:alquran_app/data/models/surat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AyatPage extends StatefulWidget {
  final SuratModel surat;
  const AyatPage({required this.surat, super.key});

  @override
  State<AyatPage> createState() => _AyatPageState();
}

class _AyatPageState extends State<AyatPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AyatCubit>().getDetailSurat(widget.surat.nomor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surat.namaLatin),
      ),
      body: BlocBuilder<AyatCubit, AyatState>(
        builder: (context, state) {
          if (state is AyatLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is AyatLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final ayat = state.detail.ayat![index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      child: Text(
                        '${ayat.nomor}',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                    title: Text(
                      '${ayat.ar}',
                      style: TextStyle(fontSize: 24),
                      textAlign: TextAlign.right,
                    ),
                    subtitle: Text('${ayat.idn}'),
                  ),
                );
              },
              itemCount: state.detail.ayat!.length,
            );
          }

          if (state is AyatError) {
            return Center(
              child: Text(state.message),
            );
          }

          return Center(
            child: Text('no data'),
          );
        },
      ),
    );
  }
}
