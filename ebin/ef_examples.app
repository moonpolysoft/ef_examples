{application, ef_examples,
 [
  {description, ""},
  {vsn, "1"},
  {modules, [
             ef_examples_app,
             ef_examples_sup,
             benchmark,
             fnv_slow,
             fnv_nif,
             fnv_offset,
             ef_bench
            ]},
  {registered, []},
  {applications, [
                  kernel,
                  stdlib
                 ]},
  {mod, { ef_examples_app, []}},
  {env, []}
 ]}.
