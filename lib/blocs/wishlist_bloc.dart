import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:everything/models/models.dart';
import 'package:everything/models/wishlist_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistLoading());
  Stream<WishlistState>  mapEventToState(
      WishlistEvent  event,
      )async* {
    if ((event is StartWishList )) {
      yield* _mapStartWishlistToSate();
    }
    else if (event is AddWishListProduct) {
      yield* _mapAddWishlistProductToSate(event, state);
    }
    else if (event is RemoveWishListProduct) {
      yield* _mapRemoveWishlistProductToState(event, state);
    }
  }
      Stream<WishlistState> _mapStartWishlistToSate() async* {
        yield WishlistLoading();
        try {
           Future<void>.delayed(const Duration(seconds: 1));
          yield WishlistLoaded();
        } catch (_) {}
      }
      Stream<WishlistState> _mapAddWishlistProductToSate (AddWishListProduct event,
          WishlistState state,) async* {
        if (state is WishlistLoaded) {
          try {
            yield WishlistLoaded(
                wishlist: Wishlist(products: List.from(state.wishlist.products)
                  ..add(event.product)));
          } catch (_) {}
        }
      }

      Stream<WishlistState> _mapRemoveWishlistProductToState(
          RemoveWishListProduct event,
          WishlistState state,) async* {
        if (state is WishlistLoaded) {
          try {
            yield WishlistLoaded(
                wishlist: Wishlist(products: List.from(state.wishlist.products)
                  ..remove(event.product)));
          } catch (_) {}
        }
      }
    }
