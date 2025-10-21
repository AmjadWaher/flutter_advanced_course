import 'package:completed_flutter_projects/core/helpers/extensions.dart';
import 'package:completed_flutter_projects/core/routing/routes.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/booking_cubit.dart';
import 'package:completed_flutter_projects/features/book_appointment/logic/cubit/booking_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookAppointmentBlocListener extends StatelessWidget {
  const BookAppointmentBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingCubit, BookingState>(
      listenWhen: (previous, current) => current.isError || current.isConfirmed,
      listener: (context, state) {
        if(state.isConfirmed)
        {
          context.pop();
          // context.pushNamed(Routes.BookingDetailsScreen);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
