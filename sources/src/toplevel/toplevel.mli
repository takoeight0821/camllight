(* System functions for interactive use *)

value quit : unit -> unit
        (* Exit the toplevel loop. *)
  and include : string -> unit
        (* Read, compile and execute source phrases from the given file.
           Definitions are entered in module [top], as if they were
           read from the keyboard.
           The [.ml] extension is automatically added to the file name,
           if not present. *)
  and load : string -> unit
        (* Load in core the source for a module.
           Read, compile and execute source phrases from the given file.
           Definitions are entered in a new module with the given name.
           The [.ml] extension is automatically added to the file name,
           if not present. *)
  and compile : string -> unit
        (* Compile a module implementation ([.ml] file) or module
           interface ([.mli] file), as with the batch compiler [camlc].
           The filename must end with either the [.ml] or the [.mli]
           extension.
           The outcome of the compilation is left in [.zo] and [.zi]
           files, and not loaded in core in any way. *)
  and verbose_mode: bool -> unit
        (* [verbose_mode true] causes the [compile] function to print
           the inferred types and other information. [verbose_mode false]
           reverts to the default silent behavior. *)
  and load_object : string -> unit
        (* Load in core a compiled bytecode file.
           The [.zo] extension is automatically added, if not present. *)
  and trace : string -> unit
        (* After [trace "foo"], all calls to the global function named [foo]
           will be traced.
           That is, the argument and the result are displayed for each call,
           as well as exceptions escaping out of [foo]. *)
  and untrace : string -> unit
        (* [untrace "foo"] stops tracing function [foo]. *)
  and install_printer : string -> unit
        (* [install_printer "printername"] registers the function named
           [printername] as a printer for objects whose types match
           its argument type. That is, the toplevel loop will call
           [printername] when it has such an object to print.
           The printing function [printername] must use the [format] library
           module to produce its output, otherwise the output of
           [printername] will not be correctly located in the values
           printed by the toplevel loop. *)
  and remove_printer : string -> unit
        (* [remove_printer "printername"] removes the function named
           [printername] from the table of toplevel printers. *)
  and set_print_depth : int -> unit
        (* [set_print_depth n] limits the printing of values to a maximal
           depth of [n]. The parts of values whose depth exceed [n]
           are printed as [...] (ellipsis). *)
  and debug_mode: bool -> unit
        (* Set whether extended module interfaces must be used
           [debug_mode true] or not [debug_mode false]. Extended
           module interfaces are [.zix] files that describe the actual
           implementation of a module, including private types and
           variables. They are generated when compiling with [camlc -g],
           or with the [compile] function above when [debug_mode] is
           [true]. When [debug_mode] is [true], toplevel phrases can refer
           to private types and variables of modules, and private functions
           can be traced with [trace]. Setting [debug_mode true] is equivalent
           to starting the toplevel with the [-g] option. *)
  and cd : string -> unit
        (* Change the current working directory. *)
  and directory : string -> unit
        (* Add the given directory to the search path for files.
           Same behavior as the [-I] option or the [#directory] directive. *)
;;    
