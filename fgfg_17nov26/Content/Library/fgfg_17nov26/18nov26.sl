namespace: fgfg_17nov26
flow:
  name: 18nov26
  workflow:
    - dfsd_17nov26:
        do:
          fgfg_17nov26.dfsd_17nov26: []
        navigate:
          - FAILURE: FAILURE
          - SUCCESS: fgfg_17nov26
    - fgfg_17nov26:
        do:
          fgfg_17nov26.fgfg_17nov26: []
        navigate:
          - FAILURE: FAILURE
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      dfsd_17nov26:
        x: 40
        'y': 80
        navigate:
          23fac52e-c569-5138-eb79-929d0eba88e7:
            targetId: fad6c74f-aeaf-602f-3e05-8713829cd321
            port: FAILURE
      fgfg_17nov26:
        x: 240
        'y': 80
        navigate:
          10e8d93e-acc3-f936-092f-3f803a5c7be5:
            targetId: 266d252e-fb86-8da1-3918-9a95c2edf157
            port: SUCCESS
          4b8c79b3-41d2-8cdd-431c-281acc6ff8d5:
            targetId: fad6c74f-aeaf-602f-3e05-8713829cd321
            port: FAILURE
    results:
      SUCCESS:
        266d252e-fb86-8da1-3918-9a95c2edf157:
          x: 520
          'y': 80
      FAILURE:
        fad6c74f-aeaf-602f-3e05-8713829cd321:
          x: 320
          'y': 240
