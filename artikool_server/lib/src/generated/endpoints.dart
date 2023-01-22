/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/artikool_endpoint.dart' as _i2;
import '../endpoints/example_endpoint.dart' as _i3;
import 'package:artikool_server/src/generated/articel.dart' as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'artikool': _i2.ArtikoolEndpoint()
        ..initialize(
          server,
          'artikool',
          null,
        ),
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
    };
    connectors['artikool'] = _i1.EndpointConnector(
      name: 'artikool',
      endpoint: endpoints['artikool']!,
      methodConnectors: {
        'getArticles': _i1.MethodConnector(
          name: 'getArticles',
          params: {
            'keyword': _i1.ParameterDescription(
              name: 'keyword',
              type: _i1.getType<String?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artikool'] as _i2.ArtikoolEndpoint).getArticles(
            session,
            keyword: params['keyword'],
          ),
        ),
        'addArticel': _i1.MethodConnector(
          name: 'addArticel',
          params: {
            'articel': _i1.ParameterDescription(
              name: 'articel',
              type: _i1.getType<_i4.Articel>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artikool'] as _i2.ArtikoolEndpoint).addArticel(
            session,
            params['articel'],
          ),
        ),
        'updateArticel': _i1.MethodConnector(
          name: 'updateArticel',
          params: {
            'articel': _i1.ParameterDescription(
              name: 'articel',
              type: _i1.getType<_i4.Articel>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artikool'] as _i2.ArtikoolEndpoint).updateArticel(
            session,
            params['articel'],
          ),
        ),
        'deleteArticel': _i1.MethodConnector(
          name: 'deleteArticel',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artikool'] as _i2.ArtikoolEndpoint).deleteArticel(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
  }
}
