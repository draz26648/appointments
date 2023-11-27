import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_task/injection.dart';
import 'package:live_task/view_model/cubit/appointments_cubit.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppointmentsCubit>()..getAppointments(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Appointments'),
          centerTitle: true,
        ),
        body: BlocBuilder<AppointmentsCubit, AppointmentsState>(
          builder: (context, state) {
            if (state is GetAppointmentsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetAppointmentsSuccess) {
              return ListView.builder(
                itemCount: state.data.results!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        state.data.results![index].doctor?.user?.name ?? ''),
                    subtitle:
                        Text(state.data.results![index].id?.toString() ?? ''),
                  );
                },
              );
            } else if (state is GetAppointmentsError) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
