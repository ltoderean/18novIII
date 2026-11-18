namespace: fgfg_17nov26
flow:
  name: csbase_I
  workflow:
    - sql_query_tabular:
        do:
          io.cloudslang.base.database.sql_query_tabular:
            - db_server_name: oowin004d.aws.swinfra.net
            - db_type: PostgreSQL
            - username: postgres
            - password:
                value: password+aws=insecure
                sensitive: true
            - db_port: '5432'
            - database_name: test_todelete
            - command: 'SELECT * FROM test.test'
            - trust_all_roots: 'true'
        navigate:
          - SUCCESS: get_time
          - FAILURE: get_time
    - get_time:
        do:
          io.cloudslang.base.datetime.get_time: []
        navigate:
          - SUCCESS: create_folder
          - FAILURE: FAILURE
    - create_folder:
        do:
          io.cloudslang.base.filesystem.create_folder:
            - folder_name: /var/tmp/oo_test
        navigate:
          - SUCCESS: delete
          - FAILURE: delete
    - delete:
        do:
          io.cloudslang.base.filesystem.delete:
            - source: /var/tmp/oo_test
        navigate:
          - SUCCESS: http_client_get
          - FAILURE: http_client_get
    - http_client_get:
        do:
          io.cloudslang.base.http.http_client_get:
            - url: 'https://oo.sigmaaks37.sma-ng.com/oo/designer/?tenantId=608821168#/'
            - trust_all_roots: 'true'
            - x_509_hostname_verifier: allow_all
        navigate:
          - SUCCESS: validate_json
          - FAILURE: FAILURE
    - validate_json:
        do:
          io.cloudslang.base.json.validate_json:
            - json_input: |-
                {
                  "id": 123,
                  "name": "test_object",
                  "created_at": "2026-06-10T15:30:00Z",
                  "active": true,
                  "tags": ["test", "sample", "json"],
                  "details": {
                    "owner": "lenuta",
                    "priority": "medium",
                    "count": 5
                  }
                }
        navigate:
          - SUCCESS: check_list_type
          - FAILURE: FAILURE
    - check_list_type:
        do:
          io.cloudslang.base.lists.check_list_type:
            - list: |-
                [
                  "item1",
                  "item2",
                  "item3"
                ]
        publish: []
        navigate:
          - SUCCESS: get_keys
          - FAILURE: FAILURE
    - get_keys:
        do:
          io.cloudslang.base.maps.get_keys:
            - map: "{'key': 'value', 'number': 123, 'active': True}"
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      sql_query_tabular:
        x: 100
        'y': 250
      get_time:
        x: 400
        'y': 250
        navigate:
          4d637da7-632b-3829-4d28-4dd661dc2a15:
            targetId: 0af3ef15-6f96-8092-5f9f-cb0790d782b3
            port: FAILURE
      create_folder:
        x: 700
        'y': 250
      delete:
        x: 1000
        'y': 250
      http_client_get:
        x: 1300
        'y': 250
        navigate:
          7d306c54-cc2f-b43b-a486-2ece21f3dd19:
            targetId: 0af3ef15-6f96-8092-5f9f-cb0790d782b3
            port: FAILURE
      validate_json:
        x: 1600
        'y': 250
        navigate:
          b09f4666-6dd0-dbd8-9854-6d118a7ed84d:
            targetId: 0af3ef15-6f96-8092-5f9f-cb0790d782b3
            port: FAILURE
      check_list_type:
        x: 1900
        'y': 250
        navigate:
          79d519b0-b196-9525-e2f8-56aa5afd5197:
            targetId: 0af3ef15-6f96-8092-5f9f-cb0790d782b3
            port: FAILURE
      get_keys:
        x: 2200
        'y': 375
        navigate:
          d45fc401-117a-da59-6a00-62b0711bb277:
            targetId: 2fa79159-4b7e-5aac-99cf-a0ba2000e607
            port: SUCCESS
    results:
      SUCCESS:
        2fa79159-4b7e-5aac-99cf-a0ba2000e607:
          x: 2500
          'y': 250
      FAILURE:
        0af3ef15-6f96-8092-5f9f-cb0790d782b3:
          x: 2200
          'y': 125
