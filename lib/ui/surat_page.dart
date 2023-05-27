import 'package:alquran_app/common/constants.dart';
import 'package:alquran_app/cubit/surat/surat_cubit.dart';
import 'package:alquran_app/ui/ayat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuratPage extends StatefulWidget {
  const SuratPage({super.key});

  @override
  State<SuratPage> createState() => _SuratPageState();
}

class _SuratPageState extends State<SuratPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SuratCubit>().getAllSurat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Surah'),
      ),
      body: BlocBuilder<SuratCubit, SuratState>(
        builder: (context, state) {
          if (state is SuratLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is SuratLoaded) {
            return ListView.builder(
              itemBuilder: ((context, index) {
                final surat = state.listSurat[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AyatPage(surat: surat)));
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        child: Text(
                          '${surat.nomor}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text('${surat.namaLatin}, ${surat.nama}'),
                      subtitle:
                          Text('${surat.arti}, ${surat.jumlahAyat} Ayat.'),
                    ),
                  ),
                );
              }),
              itemCount: state.listSurat.length,
            );
          }

          if (state is SuratError) {
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
