import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uikit/components/buttons/grey_elevated_button.dart';
import 'package:uikit/components/buttons/primary_elevated_button.dart';
import 'package:uikit/components/cards/shadow_card.dart';
import 'package:uikit/components/inputs/custom_text_form_field.dart';
import 'package:uikit/components/inputs/custom_typeahead_form_field.dart';
import 'package:uikit/components/loaders/primary_button_loader.dart';
import 'package:uikit/dimens/dimens.dart';
import 'package:domain/models/pup.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uikit/helpers/toasts.dart';
import 'package:data/repositories/map.dart';
import 'package:universal_io/io.dart';

class SignupPickLocationPage extends StatefulWidget {
  const SignupPickLocationPage({
    super.key,
    required this.pup,
  });

  final Pup pup;

  @override
  State<SignupPickLocationPage> createState() => _SignupPickLocationPageState();
}

class _SignupPickLocationPageState extends State<SignupPickLocationPage> {
  bool isLoading = false;
  LatLng _position = const LatLng(0, 0);

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final _autocompleteController = TextEditingController();

  final Set<Marker> _markers = {};

  final List<XFile> _files = [];

  static const double defaultLongitude = -58.37723;
  static const double defaultLatitude = -34.61315;
  static const double defaultZoom = 14.4746;

  @override
  void initState() {
    super.initState();
    if (widget.pup.address.isNotEmpty) {
      setState(() {
        _position = LatLng(widget.pup.latitude, widget.pup.longitude);
        _autocompleteController.text = widget.pup.address;
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        getGeolocation();
      });
    }
    if (widget.pup.locationImageFile1 != null) {
      _files.add(widget.pup.locationImageFile1!);
    }
    if (widget.pup.locationImageFile2 != null) {
      _files.add(widget.pup.locationImageFile2!);
    }
    if (widget.pup.locationImageFile3 != null) {
      _files.add(widget.pup.locationImageFile3!);
    }
    if (widget.pup.locationImageFile4 != null) {
      _files.add(widget.pup.locationImageFile4!);
    }
  }

  getGeolocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await ToastHelpers.showWarning(
          "Los servicios de geolocalización están deshabilitados.");
      setDefaultLocation();
      return;
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      await ToastHelpers.showWarning(
          "Los permisos de geolocalización están denegados.");
      setDefaultLocation();
      return;
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await ToastHelpers.showWarning(
            "Los permisos de geolocalización están denegados.");
        setDefaultLocation();
        return;
      }
    }

    final position = await Geolocator.getCurrentPosition();
    setState(() {
      _position = LatLng(position.latitude, position.longitude);
    });
  }

  setDefaultLocation() {
    setState(() {
      _position = const LatLng(defaultLatitude, defaultLongitude);
    });
  }

  addMarker(LatLng position) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: MarkerId(
            position.toString(),
          ),
          position: position,
          infoWindow: const InfoWindow(title: "Punto", snippet: null),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  void pickImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      await ToastHelpers.showSuccess('Imagen cargada exitosamente.');
      setState(() {
        _files.add(file);
      });
    }
  }

  void deleteImage(int position) {
    if (position <= _files.length) {
      setState(() {
        _files.removeAt(position);
      });
    }
  }

  Widget loadedImageOrPlaceholder(int position) {
    return position <= _files.length - 1
        ? Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.antiAlias,
            children: [
              kIsWeb
                  ? Image.network(
                      _files[position].path,
                      fit: BoxFit.fitWidth,
                    )
                  : Image.file(
                      File(_files[position].path),
                      fit: BoxFit.fitWidth,
                    ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    deleteImage(position);
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    Icons.cancel_rounded,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          )
        : Center(
            child: Icon(
              Icons.add,
              color: Theme.of(context).primaryColor,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(UIKitDimens.medium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Agregando punto',
              style: TextStyle(
                fontSize: UIKitDimens.large,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            const Text(
                'Debes agregar la dirección exacta y una foto del punto.'),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  GoogleMap(
                    markers: _markers,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: _position,
                      zoom: defaultZoom,
                    ),
                    onMapCreated: (GoogleMapController controller) async {
                      _controller.complete(controller);
                      final ctrl = await _controller.future;
                      ctrl.moveCamera(CameraUpdate.newLatLng(_position));
                    },
                    onCameraIdle: () {},
                    onTap: (argument) {
                      addMarker(argument);
                      setState(() {
                        _position = argument;
                      });
                    },
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(UIKitDimens.small),
                      child: CustomTypeAheadFormField(
                        controller: _autocompleteController,
                        hintText: 'Buscar una dirección...',
                        suffixIcon: const Icon(Icons.search),
                        minCharsForSuggestions: 5,
                        filled: true,
                        fillColor: Colors.white,
                        suggestionsCallback: (search) async {
                          if (search.isNotEmpty) {
                            if (search != widget.pup.address) {
                              return await MapRepository.getAutocompletePlaces(
                                  search);
                            }
                          }
                          return [];
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            leading: const Icon(Icons.location_pin),
                            title: Text(suggestion!.mainText),
                            subtitle: Text(suggestion.secondaryText),
                          );
                        },
                        onSuggestionSelected: (suggestion) async {
                          setState(() {
                            _autocompleteController.text =
                                suggestion!.description;
                          });
                          widget.pup.address = suggestion!.description;
                          final placeDetails =
                              await MapRepository.getPlaceDetails(
                                  suggestion!.placeId);
                          if (placeDetails != null) {
                            setState(() {
                              _position = LatLng(placeDetails.locationLatitude,
                                  placeDetails.locationLongitude);
                            });
                            final ctrl = await _controller.future;
                            ctrl.moveCamera(CameraUpdate.newLatLng(_position));
                            addMarker(_position);
                          }
                        },
                        noItemsFoundBuilder: (context) {
                          if (widget.pup.address.isEmpty) {
                            return const SizedBox(height: UIKitDimens.small);
                          }
                          return Padding(
                            padding: const EdgeInsets.all(UIKitDimens.small),
                            child: Text(
                              _autocompleteController.text == widget.pup.address
                                  ? 'Ingresa una dirección'
                                  : 'Ningún resultado encontrado.',
                              style: const TextStyle(
                                fontSize: UIKitDimens.medium,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            ShadowCard(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (var i = 0; i < 4; ++i) ...[
                        Expanded(
                          child: Container(
                            height: UIKitDimens.extraExtraExtraLarge,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            foregroundDecoration: BoxDecoration(
                              border: Border.all(
                                width: UIKitDimens.extraSmall,
                                color: Theme.of(context).primaryColor,
                              ),
                              borderRadius:
                                  BorderRadius.circular(UIKitDimens.medium),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: UIKitDimens.extraSmall,
                                color: Theme.of(context).primaryColor,
                              ),
                              borderRadius:
                                  BorderRadius.circular(UIKitDimens.medium),
                            ),
                            child: loadedImageOrPlaceholder(i),
                          ),
                        ),
                        const SizedBox(
                          width: UIKitDimens.small,
                        ),
                      ]
                    ],
                  ),
                  const SizedBox(
                    height: UIKitDimens.small,
                  ),
                  GreyElevatedButton(
                    onPressed: () async {
                      if (_files.length + 1 > 4) {
                        await ToastHelpers.showWarning(
                            'Puedes tomar un máximo de 4 fotos.');
                        return;
                      }
                      pickImage();
                    },
                    isFullWidth: true,
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          width: UIKitDimens.medium,
                        ),
                        const Text('Tomar fotos del punto')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            PrimaryElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                if (widget.pup.address.isNotEmpty && _files.isNotEmpty) {
                  goBackAndSave();
                }
                setState(() {
                  isLoading = false;
                });
              },
              isFullWidth: true,
              child: widget.pup.address.isEmpty
                  ? const Text('Busca y selecciona una ubicación')
                  : _files.isEmpty
                      ? const Text('Sube al menos 1 foto')
                      : isLoading
                          ? const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PrimaryButtonLoader(),
                                SizedBox(
                                  width: UIKitDimens.small,
                                ),
                                Text('Enviando'),
                              ],
                            )
                          : const Text('Enviar y continuar'),
            ),
            const SizedBox(
              height: UIKitDimens.medium,
            ),
            GreyElevatedButton(
              onPressed: () {
                goBack();
              },
              isFullWidth: true,
              child: const Text('Cancelar'),
            ),
          ],
        ),
      ),
    );
  }

  goBack() {
    Navigator.pop(context);
  }

  goBackAndSave() {
    widget.pup.latitude = _position.latitude;
    widget.pup.longitude = _position.longitude;
    for (var i = 0; i < _files.length; ++i) {
      switch (i) {
        case 0:
          widget.pup.locationImageFile1 = _files[0];
          break;
        case 1:
          widget.pup.locationImageFile2 = _files[1];
          break;
        case 2:
          widget.pup.locationImageFile3 = _files[2];
          break;
        case 3:
          widget.pup.locationImageFile4 = _files[3];
          break;
      }
    }
    Navigator.pop(context, widget.pup);
  }
}
