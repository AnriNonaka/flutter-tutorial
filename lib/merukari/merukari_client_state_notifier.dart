import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/merukari/repository/merukari_repository.dart';
import 'package:flutter_tutorial/merukari/state/merukari_client_state.dart';

final merukariClientStateNotifier = StateNotifierProvider.autoDispose<
    MerukariClientStateNotifier,
    MerukariClientState>((ref) => MerukariClientStateNotifier(ref.read));

class MerukariClientStateNotifier extends StateNotifier<MerukariClientState> {
  MerukariClientStateNotifier(this._read) : super(const MerukariClientState()) {
    fetchMerukariItems();
  }

  final Reader _read;

  Future<void> fetchMerukariItems() async {
    state = state.copyWith(isLoading: true);
    final merukariItems =
        await _read(merukariRepositoryProvider).fetchMerukariItems();

    if (merukariItems.isNotEmpty) {
      state = state.copyWith(
        isLoading: false,
        isReadyData: true,
        merukariItems: merukariItems,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
        isReadyData: false,
        merukariItems: merukariItems,
      );
    }
  }

  void onBackHome() {
    state = state.copyWith(
      isLoading: false,
      isReadyData: false,
    );
  }
}
