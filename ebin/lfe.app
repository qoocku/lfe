%% -*- erlang -*-
%% Copyright (c) 2013 Robert Virding
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.

{application, lfe,
 [{description, "Lisp Flavored Erlang (LFE)"},
  {vsn, "0.9.0-dev"},
  {modules, ['lfe_io', 'lfe_pmod', 'lfe_bits', 'lfe_trans', 'lfe_macro_include', 'lfe_comp', 'lfe_gen', 'lfe_parse', 'lfescript', 'lfe_init', 'lfe_io_pretty', 'lfe_env', 'lfe_scan', 'lfe_lint', 'lfe_lib', 'lfe_macro', 'lfe_codegen', 'lfe_io_format', 'lfe_ms', 'lfe_shell', 'lfe_qlc', 'lfe_eval', 'lfe_macro_record']},
  {registered, []},
  {applications, [kernel,stdlib,compiler]}
 ]}.
